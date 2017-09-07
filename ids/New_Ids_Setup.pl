#!/usr/bin/perl -w


require Term::ANSIColor;
use Term::ANSIColor;
use strict;
my $code;
my $hone;
my $log;

print color("red"),"
			IIIIIIIIII                  DDDDDDDDDDDDD                             SSSSSSSSSSSSSSS 
			I::::::::I                  D::::::::::::DDD                        SS:::::::::::::::S
			I::::::::I                  D:::::::::::::::DD                     S:::::SSSSSS::::::S
			II::::::II                  DDD:::::DDDDD:::::D                    S:::::S     SSSSSSS
	  		  I::::I                      D:::::D    D:::::D                   S:::::S            
	  		  I::::I                      D:::::D     D:::::D                  S:::::S            
	  		  I::::I                      D:::::D     D:::::D                   S::::SSSS         
	  		  I::::I                      D:::::D     D:::::D                    SS::::::SSSSS    
	  		  I::::I                      D:::::D     D:::::D                      SSS::::::::SS  
	  		  I::::I                      D:::::D     D:::::D                         SSSSSS::::S 
	  		  I::::I                      D:::::D     D:::::D                              S:::::S
	  		  I::::I                      D:::::D    D:::::D                               S:::::S
			II::::::II                  DDD:::::DDDDD:::::D                    SSSSSSS     S:::::S
			I::::::::I      ......      D:::::::::::::::DD         ......      S::::::SSSSSS:::::S
			I::::::::I      .::::.      D::::::::::::DDD           .::::.      S:::::::::::::::SS 
			IIIIIIIIII      ......      DDDDDDDDDDDDD              ......       SSSSSSSSSSSSSSS   \n", color("reset");
			
print "\n\n\n\n";											
print color("green"),"                                                                                              Programmers : \n", color("reset");
print color("blue"),"                                                                                                      -> Amogh And Utkarsh\n", color("reset");
print color("blue"),"	                                                                                                   -> ....\n", color("reset");
START:
print color("cyan")," Choose from <1-15> from following :\n", color("reset");
print "\n";
print color("green"),"---------------------\n",color("reset");
print color("green"),"   Firewall Options\n", color("reset");
print color("green"),"---------------------\n", color("reset");
print color("yellow"),"1 = Black listing IP A.K.A Blocking Ip Address \n", color("reset");
print color("yellow"),"2 = Black listing Mac A.K.A Blocking Mac Address \n", color("reset");
print color("yellow"),"3 = Black listing Ports A.K.A Blocking Ports \n", color("reset");
print color("yellow"),"4 = Block Websites \n", color("reset");
print color("yellow"),"5 = Block Ads & Spamming Ip Address \n", color("reset");
print color("yellow"),"6 = Malware Or Evil Shell Finder \n", color("reset");
print color("yellow"),"7 = Trojan Scanner \n", color("reset");
print color("green"),"---------------------\n",color("reset");
print color("green")," Dos/Ddos Detection\n", color("reset");
print color("green"),"---------------------\n",color("reset");
print color("yellow"),"8 = Check For ARP Poisoning \n", color("reset");
print color("yellow"),"9 = Check For HTTP DDos \n", color("reset");
print color("yellow"),"10 = Check For UDP Ddos \n", color("reset");
print color("yellow"),"11 = Check For TCP / IP Ddos \n", color("reset");
print color("yellow"),"12 = Check For SYN Ddos \n", color("reset");
print color("yellow"),"13 = Block Dos-Ddos Automatic \n", color("reset");
print color("yellow"),"14 = Check Ping Of Death Attack \n", color("reset"); 
print color("red"),"15 = Log Out \n", color("reset");
print "\n";
print "--->";
$code=<STDIN>;
chomp($code);
if($code eq "1")
{
print "\n";
print "Black listing IP A.K.A Blocking Ip Address Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Ip_Address_Blocking.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "2")
{
print "\n";
print "Black listing Mac A.K.A Blocking Mac Address Started --------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/MAC_Filtering.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "3")
{ 
print "\n";
print "Port Blocking Started ------------------------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Port_Filtering.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "4")
{
print "\n";
print "Website Blocking Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Block_Website.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "5")
{
print "\n";
print "Ads Blocking Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Spamming_IP_Block.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "6")
{
print "\n";
print "Evil Shell Searching Started ---------------------------------------- OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Firewall/evil_shell_finder.pl');
print "\n";
system('clear');
goto START;
}
elsif($code eq "7")
{
print "\n";
print "Hunting Trojan Started ---------------------------------------- OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Firewall/Trojan_Scan.pl');
print "\n";
system('clear');
goto START;
}
if($code eq "8")
{
print "\n";
print "ARP Poisoning Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/Final_Arp_Spoofing_detection.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "9")
{
print "\n";
print "HTTP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/http.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "10")
{ 
print "\n";
print "UDP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/udp.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "11")
{
print "\n";
print "TCP / IP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/Tcp-Ip.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "12")
{
print "\n";
print "SYN Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/SYN.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "13")
{
print "\n";
print "Automatic Dos-Ddos Blocking Started ------------------------ OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Ddos/blockdos.pl');
print "\n";
system('clear');
goto START;
}
elsif($code eq "14")
{
print "\n";
print "Ping Of Death Attack Detection Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/PingOfDeathDetector.sh');
print "\n";
system('clear');
goto START;
}
elsif($code eq "15")
{
	exit(0);
}
else
{
system('clear');
print color("red"),"Wrong Code Entered......!!!!!! \n", color("reset");
goto START;
}


