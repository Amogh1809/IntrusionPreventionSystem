#!/usr/bin/perl -w


require Term::ANSIColor;
use Term::ANSIColor;
use strict;
my $code;
my $fire;
my $hone;
my $dos;
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
			
print color("yellow"), "
.___        __                      .__                ________          __                 __  .__                  _________               __                  
|   | _____/  |________ __ __  _____|__| ____   ____   l______ l   _____/  |_  ____   _____/  |_|__| ____   ____    /   _____/__.__. _______/  |_  ____   _____  
|   |/    l   __l_  __ l  |  l/  ___/  |/  _ l /    l   |    |  l_/ __ l   __l/ __ l_/ ___l   __l  |/  _ l /    l   l_____  <   |  |/  ___/l   __l/ __ l /     l 
|   |   |  l  |  |  | l/  |  /l___ l|  (  <_> )   |  l  |    `   l  ___/|  | l  ___/l  l___|  | |  (  <_> )   |  l  /        l___  |l___ l  |  | l  ___/|  Y Y  l
|___|___|  /__|  |__|  |____//____  >__|l____/|___|  / /_______  /l___  >__|  l___  >l___  >__| |__|l____/|___|  / /_______  / ____/____  > |__|  l___  >__|_|  /
         l/                       l/               l/          l/     l/          l/     l/                    l/          l/l/         l/            l/      l/ 
\n", color("reset");												
print color("green"),"                                                                                              Programmers : \n", color("reset");
print color("blue"),"                                                                                                      -> Amogh And Utkarsh\n", color("reset");
print color("blue"),"	                                                                                                   -> ....\n", color("reset");
START:
print color("cyan")," Choose from <1-5> from following :\n", color("reset");
print "\n";
print color("green"),"1 = Use Firewall\n", color("reset");
print color("green"),"2 = Use Honeypot\n", color("reset"); 
print color("green"),"3 = Use Dos/Ddos Detection\n", color("reset"); 
print color("green"),"4 = Check Logs\n", color("reset");
print color("red"),"5 = Log Out \n", color("reset");
print "\n";
print "--->";
$code=<STDIN>;
chomp($code);
if($code eq "1")
{
START2:
print "\n";
print color("red"),"[+] You Have Choosen Firewall. Press <1-8> for following options :\n", color("reset");
print "\n";
print color("yellow"),"1 = Black listing IP A.K.A Blocking Ip Address \n", color("reset");
print color("yellow"),"2 = Black listing Mac A.K.A Blocking Mac Address \n", color("reset");
print color("yellow"),"3 = Black listing Ports A.K.A Blocking Ports \n", color("reset");
print color("yellow"),"4 = Block Websites \n", color("reset");
print color("yellow"),"5 = Block Ads & Spamming Ip Address \n", color("reset");
print color("yellow"),"6 = Malware Or Evil Shell Finder \n", color("reset");
print color("yellow"),"7 = Trojan Scanner \n", color("reset");
print color("blue"),"8 = Back To Main Menu \n", color("reset");
print "\n";
print "--->";
$fire=<STDIN>;
chomp($fire);
if($fire eq "1")
{
print "\n";
print "Black listing IP A.K.A Blocking Ip Address Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Ip_Address_Blocking.sh');
print "\n";
goto START2;
}
elsif($fire eq "2")
{
print "\n";
print "Black listing Mac A.K.A Blocking Mac Address Started --------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/MAC_Filtering.sh');
print "\n";
goto START2;
}
elsif($fire eq "3")
{ 
print "\n";
print "Port Blocking Started ------------------------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Port_Filtering.sh');
print "\n";
goto START2;
}
elsif($fire eq "4")
{
print "\n";
print "Website Blocking Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Block_Website.sh');
print "\n";
goto START2;
}
elsif($fire eq "5")
{
print "\n";
print "Ads Blocking Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Firewall/Spamming_IP_Block.sh');
print "\n";
goto START2;
}
elsif($fire eq "6")
{
print "\n";
print "Evil Shell Searching Started ---------------------------------------- OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Firewall/evil_shell_finder.pl');
print "\n";
goto START2;
}
elsif($fire eq "7")
{
print "\n";
print "Hunting Trojan Started ---------------------------------------- OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Firewall/Trojan_Scan.pl');
print "\n";
goto START2;
}
elsif($fire eq "8")
{
system('clear');
goto START;
}
else
{
system('clear');
print color("red"),"Wrong Code Entered......!!!!!! \n", color("reset");
goto START;
}
}
elsif($code eq "2")
{
START3:
print "\n";
print color("red"),"[+] You Have Choosen Honeypot. Press <1-4> for following options :\n", color("reset");
print "\n";
print color("yellow"),"1 = Create Fake Access Point \n", color("reset");
print color("yellow"),"2 = Stop Fake Access Point \n", color("reset");
print color("yellow"),"3 = Port Scanning Attack Detector \n", color("reset");
print color("blue"),"4 = Back To Main Menu \n", color("reset");
print "\n";
print "--->";
$hone=<STDIN>;
chomp($hone);
if($hone eq "1")
{
print "\n";
print "Program For Fake Access Point Started  ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Honeypot/fake_access_point.sh');
print "\n";
goto START3;
}
elsif($hone eq "2")
{
print "\n";
print "Program For Killing Fake Access Point Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Honeypot/kill_fake_access_point.sh');
print "\n";
goto START3;
}
elsif($hone eq "3")
{
print "\n";
print "Port Scannin Attack Detector Started------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Honeypot/main.sh');
print "\n";
goto START3;
}
elsif($hone eq "4")
{
system('clear');
goto START;
}
else
{
system('clear');
print color("red"),"Wrong Code Entered......!!!!!! \n", color("reset");
goto START3;
}
}
elsif($code eq "3")
{
START4:
print "\n";
print color("red"),"[+] You Have Choosen Dos / Ddos Detection. Press <1-10> for following options :\n", color("reset");
print "\n";
print color("yellow"),"1 = Check For ARP Poisoning \n", color("reset");
print color("yellow"),"2 = Check For HTTP DDos \n", color("reset");
print color("yellow"),"3 = Check For UDP Ddos \n", color("reset");
print color("yellow"),"4 = Check For TCP / IP Ddos \n", color("reset");
print color("yellow"),"5 = Check For SYN Ddos \n", color("reset");
print color("yellow"),"6 = Block Dos-Ddos Automatic \n", color("reset");
print color("yellow"),"7 = Check Ping Of Death Attack \n", color("reset");
print color("blue"),"8 = Back To Main Menu \n", color("reset");
print "\n";
print "--->";
$dos=<STDIN>;
chomp($dos);
if($dos eq "1")
{
print "\n";
print "ARP Poisoning Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/Final_Arp_Spoofing_detection.sh');
print "\n";
goto START4;
}
elsif($dos eq "2")
{
print "\n";
print "HTTP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/http.sh');
print "\n";
goto START4;
}
elsif($dos eq "3")
{ 
print "\n";
print "UDP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/udp.sh');
print "\n";
goto START4;
}
elsif($dos eq "4")
{
print "\n";
print "TCP / IP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/Tcp-Ip.sh');
print "\n";
goto START4;
}
elsif($dos eq "5")
{
print "\n";
print "SYN Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/SYN.sh');
print "\n";
goto START4;
}
elsif($dos eq "6")
{
print "\n";
print "Automatic Dos-Ddos Blocking Started ------------------------ OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Ddos/blockdos.pl');
print "\n";
goto START4;
}
elsif($dos eq "7")
{
print "\n";
print "Ping Of Death Attack Detection Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Ddos/PingOfDeathDetector.sh');
print "\n";
goto START4;
}
elsif($dos eq "8")
{
system('clear');
goto START;
}
else
{
system('clear');
print color("red"),"Wrong Code Entered......!!!!!! \n", color("reset");
goto START4;
}
}
elsif($code eq "4")
{
START5:
print "\n";
print color("red"),"[+] You Have Choosen Log File Monitoring. Press <1-7> for following options :\n", color("reset");
print "\n";
print color("yellow"),"1 = Check Modification Time/date For Files \n", color("reset");
print color("yellow"),"2 = Check Permission Modification \n", color("reset");
print color("yellow"),"3 = Check Unexplained Changes In The File's Size \n", color("reset");
print color("yellow"),"4 = Modification To System boot logs \n", color("reset");
print color("yellow"),"5 = Clean System logs \n", color("reset");
print color("yellow"),"6 = Check & Give Threshold Password To Accounts\n", color("reset");
print color("blue"),"7 = Back To Main Menu \n", color("reset");
print "\n";
print "--->";
$log=<STDIN>;
chomp($log);
if($log eq "1")
{
print "\n";
print "Check Modification Time/date For Files Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Logs/a.sh');
print "\n";
goto START5;
}
if($log eq "2")
{
print "\n";
print "Check Permission Modification Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Logs/b.sh');
print "\n";
goto START5;
}
if($log eq "3")
{
print "\n";
print "Check Unexplained Changes In The File's Size Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Logs/c.sh');
print "\n";
goto START5;
}
if($log eq "4")
{
print "\n";
print "Modification To System Boot Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Logs/System_Boot_Logs.sh');
print "\n";
goto START5;
}
if($log eq "5")
{
print "\n";
print "Program For Cleaning Logs Started ------------------------ OK \n";
system('perl /home/amoghbabbar/Desktop/vips/ids/Logs/LogCleaner.pl');
print "\n";
goto START5;
}
if($log eq "6")
{
print "\n";
print "Check & Give Threshold Password To Accounts Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/vips/ids/Logs/Logins_Logs_Attempt.sh');
print "\n";
goto START5;
}
elsif($log eq "7")
{
system('clear');
goto START;
}
else
{
system('clear');
print color("red"),"Wrong Code Entered......!!!!!! \n", color("reset");
goto START5;
}
}
if($code eq "5")
{
exit(0);
}
else
{
system('clear');
print color("red"),"Wrong Code Entered......!!!!!! \n", color("reset");
goto START;
}
