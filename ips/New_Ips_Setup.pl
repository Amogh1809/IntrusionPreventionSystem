#!/usr/bin/perl -w


require Term::ANSIColor;
use Term::ANSIColor;
use strict;
use Term::ProgressBar;
my $code;
my $hone;
my $log;

print color("red"),"





                                  'O.   :o                                                      
                                   ,Xo   lK,                                                    
                                    'XK:  oNk.                                                  
                      :c'    .o'     .KNO, cXXo                                                 
               ...    .XNN0d:'XNXx;.  .ONNk',XNXc                                               
               ;KNNNXK0XNNNNNNNNNNNN0dc;0NNNx;kNN0;                                             
             .',lXNNNNNNNNNNNNNNNNNNNNNNNNNNNNkONNN0,                                           
         l0XNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNK:                                         
          ,KNNNNNNNNNNNNNXK00000KNNNNNNNNNNNNNNNNNNNNNNXo.                                      
        :kXNNNNNNNNN0o;.          .':d0NNNNNNNNNNNNNNNNNNNx.                                                ██╗  ██╗ █████╗ ██╗     ██╗         
     ;kXNNNNNNNNNXd.                   .;dXNNNNNNNNNNNNNNNNNd                                               ██║ ██╔╝██╔══██╗██║     ██║         
      .,0NNNNNNN0.                         ;kNNNNNNNNNNNNXNNNK'                                             █████╔╝ ███████║██║     ██║         
      .kNNNNNNN0.                            .dNNNNNNNNNNo'0NNX:                                            ██╔═██╗ ██╔══██║██║     ██║         
     ;KNNNNNNNN;                               .ONNNNNNNNN0cdXNNl                                           ██║  ██╗██║  ██║███████╗██║         
    xNNNNNNNNNN.                                 cXNNNNNNNNNXKNNNx.                                         ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝         
       lNNNNNNN'                                  .xNNNNNNNNNNNNNNO'                                                                            
       0NNNNNNNk                                    .lKNNNNNNNNNNN,                                 ██╗██████╗ ███████╗         ██████╗ ███████╗
      ;NNNNNNNNNk                                      'l0NNNNNNNNXc                                ██║██╔══██╗██╔════╝        ██╔═══██╗██╔════╝
      kkcoNNNNNNN0'                                       .lKNNNNNNNK:                              ██║██████╔╝███████╗        ██║   ██║███████╗
          ONNNNNNNNx.                                        'ONNNNNNNXd,                           ██║██╔═══╝ ╚════██║        ██║   ██║╚════██║
          'NNNNNNNNNNx'                                        :XNNNNNNNNK                          ██║██║     ███████║        ╚██████╔╝███████║
           xx.;ONNNNNNN0c.                                      .KNNNNNNN:                          ╚═╝╚═╝     ╚══════╝         ╚═════╝ ╚══════╝
                .lKNNNNNNNOc.                                    ;NNNNN0'                                                                       
                   .lONNNNNNNKo;.                                :NNXd,                         
                       ,o0NNNNNNN0d;.                            l:.                            
                          .,oONNNNNNNXxc.                                                       
                               .cxKNNNNNNXd;                                                    
                                   .,lOXNNNNXd'                                                 
                                        'l0NNNN0:                                                 
                                           .cONNNK;                                                  
                                              .lKNNO.                                             PROGRAMMERS :   
                                                 cKNK.                                            --> AMOGH BABBAR  				
                                                   oNX.                                           --> UTKARSH MITTAL  			 
                                                    ;N0                                            				 
                                                     cN'                                        
                                                      O,                                        
                                                      ;.                                  







                                                             ",color("reset");

   sleep(1);
   print "Loading System Modules!!\n" ;
   my $total = 5;
   my $progress_bar = Term::ProgressBar->new($total);
   for my $i (1 .. $total) 
   {
		sleep (1);
		$progress_bar->update($i);

   }
   system("clear");

  print color("green")," 

                                        ### #     # ####### ######  #     #  #####  ### ####### #     #                                  
                                         #  ##    #    #    #     # #     # #     #  #  #     # ##    #                                  
                                         #  # #   #    #    #     # #     # #        #  #     # # #   #                                  
                                         #  #  #  #    #    ######  #     #  #####   #  #     # #  #  #                                  
                                         #  #   # #    #    #   #   #     #       #  #  #     # #   # #                                  
                                         #  #    ##    #    #    #  #     # #     #  #  #     # #    ##                                  
                                        ### #     #    #    #     #  #####   #####  ### ####### #     #                                  
                                                                                                                                         
       ######  ######  ####### #     # ####### #     # ####### ### ####### #     #        #####  #     #  #####  ####### ####### #     # 
       #     # #     # #       #     # #       ##    #    #     #  #     # ##    #       #     #  #   #  #     #    #    #       ##   ## 
       #     # #     # #       #     # #       # #   #    #     #  #     # # #   #       #         # #   #          #    #       # # # # 
       ######  ######  #####   #     # #####   #  #  #    #     #  #     # #  #  #        #####     #     #####     #    #####   #  #  # 
       #       #   #   #        #   #  #       #   # #    #     #  #     # #   # #             #    #          #    #    #       #     # 
       #       #    #  #         # #   #       #    ##    #     #  #     # #    ##       #     #    #    #     #    #    #       #     # 
       #       #     # #######    #    ####### #     #    #    ### ####### #     #        #####     #     #####     #    ####### #     # 
                                                                                                                                           \n", color("reset");
			
print "\n\n\n\n";											
START:
print color("cyan")," \nChoose from <1-15> from following :\n", color("reset");
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
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/Ip_Address_Blocking.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "2")
{
print "\n";
print "Black listing Mac A.K.A Blocking Mac Address Started --------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/MAC_Filtering.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "3")
{ 
print "\n";
print "Port Blocking Started ------------------------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/Port_Filtering.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "4")
{
print "\n";
print "Website Blocking Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/Block_Website.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "5")
{
print "\n";
print "Ads Blocking Started ---------------------------------------- OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/Spamming_IP_Block.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "6")
{
print "\n";
print "Evil Shell Searching Started ---------------------------------------- OK \n";
system('perl /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/evil_shell_finder.pl');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "7")
{
print "\n";
print "Hunting Trojan Started ---------------------------------------- OK \n";
system('perl /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Firewall/Trojan_Scan.pl');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
if($code eq "8")
{
print "\n";
print "ARP Poisoning Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/Final_Arp_Spoofing_detection.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "9")
{
print "\n";
print "HTTP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/http.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "10")
{ 
print "\n";
print "UDP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/udp.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "11")
{
print "\n";
print "TCP / IP Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/Tcp-Ip.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "12")
{
print "\n";
print "SYN Ddos Attack Detection Is Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/SYN.sh');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "13")
{
print "\n";
print "Automatic Dos-Ddos Blocking Started ------------------------ OK \n";
system('perl /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/blockdos.pl');
print "\n";
#sleep(2);
#system('clear');
goto START;
}
elsif($code eq "14")
{
print "\n";
print "Ping Of Death Attack Detection Started ------------------------ OK \n";
system('sh /home/amoghbabbar/Desktop/IntrusionPrevention/ips/Ddos/PingOfDeathDetector.sh');
print "\n";
#sleep(2);
#system('clear');
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


