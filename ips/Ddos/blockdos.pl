#!/usr/bin/perl


use strict;
use warnings;

use vars qw(%CONFIG %blocked);

$| = 1;

my %CONFIG = (

  ## 0 = No output
  ## 1 = Actions reported
  ## 2 = Actions + unix commands reported
  ## 3 = Verbose in the extreme

  DEBUG => 2,

  ## Do we perform checks only - no IPTABLE changes - Good for debugging

  TESTMODE => 0,

  ## Ban IP addresses above this number of accesses

  THRESHOLD => 150,

  ## How long, in seconds, between checks

  INTERVAL => 5,

  ## If we have APF use that, otherwise fallback on iptables

  USEAPF => 0,

  ## How long (in seconds) do we ban people for
  ## escalating each time they're bad
  ## This resets to the first item, when they have gone
  ## a full interval without being flagged
  ##
  ## 60, 300, 3600 would mean that they are banned for 60 seconds, then 5 minutes, then an hour
  ## 
  ## This list can have as many increment levels as you like

  BANINCREMENTS => [60, 120, 240, 800, 1200],

  ## IP ADDRESSES THAT WE WILL NEVER BAN

  EXCLUDEIPS => [ "127.0.0.1", "10.0.0.1" ],

  ## UNIX COMMANDS 

  NETSTAT => "/bin/netstat",

  IPT => "/usr/sbin/iptables",

  APF => "/usr/local/sbin/apf",

  SENDMAIL => "/usr/sbin/sendmail",

  ## WHERE TO STORE/SAVE OUTPUT

  LOGDIR => "/var/log/ddosblock",

  MAILTO => "nobody\@example.com", # NOTE: Under Perl you have to escape the @ symbol with a slash

  STDOUT => 1, # In addition to logging, do we want to report it to STDOUT

);

$CONFIG{TOTINCREMENTS} = $#{$CONFIG{BANINCREMENTS}};
$CONFIG{LISTFILE}      = "$CONFIG{LOGDIR}/bannedips.txt";
$CONFIG{LASTDAY}       = 0;

if ( ! -d $CONFIG{LOGDIR})
{
  print "Creating log directory $CONFIG{LOGDIR}\n\n";
  mkdir $CONFIG{LOGDIR},700;
}

my $command = qq($CONFIG{NETSTAT} -ntu | awk '{print \$5}' | cut -d: -f1 | grep ^[0-9] | sort | uniq -c | sort -nr | head -30 );

&rotatelog();

if ($CONFIG{TESTMODE} == 1)
{
  &debug(qq(** NOTE **\n\nTest mode - No IPTABLE changes will be made\n));
}

&loadbanned();

while (1)
{
  &rotatelog();

  &check(); 

  &release();

  &debug(qq(- Checking Attack At Every $CONFIG{INTERVAL} seconds\n)) if ($CONFIG{DEBUG} > 1);

  sleep $CONFIG{INTERVAL};
}

sub rotatelog
{
  my @date = localtime();
  my $weekday = $date[6];

  if ($weekday != $CONFIG{LASTDAY})
  {
    if ($CONFIG{LASTDAY})
    {
      close(DEBUG);
    }
    $CONFIG{LASTDAY} = $weekday;

    open(DEBUG, "> $CONFIG{LOGDIR}/doslog.$weekday.txt");
  }
}

sub check
{
  my @input = `$command`;

  my $now = time;

  my $savelist;

  INPUTLOOP:
  foreach my $item (@input)
  {
    chomp($item);

    $item =~ s/^ +//io;
    $item =~ s/ +/ /io;

    &debug("-- $item\n") if ($CONFIG{DEBUG} >= 3);

    my ($hits, $ipaddress) = split(/ /, $item);

    next INPUTLOOP if (grep(/^$ipaddress/, @{$CONFIG{EXCLUDEIPS}}));

    next INPUTLOOP if (defined $blocked{$ipaddress} && $now < $blocked{$ipaddress}{sleepuntil});

    if ($hits > $CONFIG{THRESHOLD})
    {
      $blocked{$ipaddress}{blocklevel} = $blocked{$ipaddress}{lastblock} + 1 || 1;
      $blocked{$ipaddress}{lastblock}  = $blocked{$ipaddress}{blocklevel};

      if ($blocked{$ipaddress}{blocklevel} == 1)
      {
        my $iptcmd     = ($CONFIG{USEAPF}) ?
          "$CONFIG{APF} -d $ipaddress"
        :
          "$CONFIG{IPT} -I INPUT -s $ipaddress -j DROP";

        my $ok = `$iptcmd` unless ($CONFIG{TESTMODE});

        &debug("Adding block for $ipaddress ($hits hits/minute)") if ($CONFIG{DEBUG} > 0);
        &debug("- Command $iptcmd") if ($CONFIG{DEBUG} > 1);

        if ($CONFIG{MAILTO})
        {
          my $localtime = localtime();

          open (MAIL, "| $CONFIG{SENDMAIL} -t");
          print MAIL qq(To: $CONFIG{MAILTO}\nSubject: IP address $ipaddress banned\n\nBanned ip addresses $ipaddress on $localtime with $hits hits\n);
          close (MAIL);
        }
      }
      else
      {
        &debug("Setting $ipaddress to block level $blocked{$ipaddress}{blocklevel} ($hits hits/minute)") if ($CONFIG{DEBUG} > 0);
      }

      &updatesleep($ipaddress);

      $savelist = 1;
    }
  }

  # Save a list of banned IPs to a file incase this process dies
  if ($savelist)
  {
    &savebanned();
  }
}

sub release
{
  my $now = time;
  my $savelist;

  # Loop through all the IP addresses flagged

  foreach my $ipaddress (keys %blocked)
  {
    # No point looking at it until we've gone past the sleep date

    if ($now > $blocked{$ipaddress}{sleepuntil})
    {
      $blocked{$ipaddress}{passcount}++;

      # Remove the block on the first pass
      # then remove the 

      if ($blocked{$ipaddress}{passcount} == 1)
      {
        # Release the block

        my $iptcmd = ($CONFIG{USEAPF}) ?
          "$CONFIG{IPT} -u "
          :
          "$CONFIG{IPT} -D INPUT -s $ipaddress -j DROP";

        &debug("Removing block from $ipaddress") if ($CONFIG{DEBUG}> 0);
        &debug("- Command $iptcmd") if ($CONFIG{DEBUG} > 1);

        my $ok = `$iptcmd` unless ($CONFIG{TESTMODE});

        $blocked{$ipaddress}{blocklevel} = 0;
      }
      else
      {
        &debug("- Two passes without issue $ipaddress, forgetting block level") if ($CONFIG{DEBUG} > 1);
        delete $blocked{$ipaddress};
      }

      $savelist = 1;
    }
  }

  # Save a list of banned IPs to a file incase this process dies
  if ($savelist)
  {
    &savebanned(\%blocked);
  }
}

sub updatesleep
{
  my ($ipaddress) = @_;

  my $blocklevel = $blocked{$ipaddress}{blocklevel};

  $blocklevel = ($blocklevel >= $CONFIG{TOTINCREMENTS}) ? $#{$CONFIG{BANINCREMENTS}} : $blocklevel;

  my $increment = $CONFIG{BANINCREMENTS}[$blocklevel - 1];

  $blocked{$ipaddress}{sleepuntil} = time + $increment;

  my $stamp = localtime(time + $increment);

  &debug("- Will check $ipaddress after $increment seconds ($stamp) - Block level $blocklevel") if ($CONFIG{DEBUG} > 1);
}

sub loadbanned
{
  undef %blocked;

  if (-f $CONFIG{LISTFILE})
  {
    open(LIST, "< $CONFIG{LISTFILE}");
    my @list = <LIST>;
    close (LIST);

    # Rebuild a list of those things we've blocked
    foreach my $ipaddress (@list)
    {
      chomp($ipaddress);

      # Let them be released and evaluated again
      $blocked{$ipaddress}{sleepuntil} = 1;
      $blocked{$ipaddress}{blocklevel} = 1;
      $blocked{$ipaddress}{lastblock}  = 1;
      $blocked{$ipaddress}{passcount}  = 0;

      &debug("- Loading blocked IP $ipaddress") if ($CONFIG{DEBUG} > 0);

    }
  }
}

sub savebanned
{
  my ($list) = @_;

  open(LIST, "> $CONFIG{LISTFILE}");
  print LIST join("\n", keys %blocked);
  close (LIST);
}

sub debug
{
  my ($line) = @_;

  print DEBUG localtime() . " $line \n";

  if ($CONFIG{STDOUT})
  {
    print localtime() . " $line \n";
  }
}
