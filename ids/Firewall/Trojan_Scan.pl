#!/usr/bin/perl

use IO::Socket;
$victim = $ARGV[0];
$timeout = 5;
if($ARGV[0] eq $ARGV[1])
{
print ("Enter Victim Server Name : \n");
$victim=<STDIN>;
print ("Initiating A Scan $victim\n\n");
}
# Most Wanted ports for the Trojans.
@ports = ( 32418, 777, 10666, 25, 30029, 1999, 5400, 8787, 54320, 1349,
             31337, 31338, 34324, 1042, 20331, 5400, 5401, 5402, 121,
             31666, 2115, 20203, 10607, 3150, 2140, 60000, 6670, 6671,
             6771, 26274, 47262, 6883, 1000, 65000, 1012, 21, 1011, 1010,
             1015, 1016, 12701, 23456, 80, 4567, 5321, 50766, 1492, 12345,
             12346, 6969, 6970, 21544, 21554, 12076, 12223, 31787, 31785,
             2023, 8879, 31, 456, 99, 2283, 7789, 4590, 4950, 5521, 9400,
             6939, 555, 9989, 30999, 13700, 3129, 40421, 40422, 40423,
             40426, 1269, 20000, 20001, 20034, 5031, 5032, 7300, 7301,
             7306, 7307, 7308, 30100, 30101, 30102, 30133, 1033, 31339,
             49301, 5011, 2023, 2801, 3700, 9872, 9873, 9874, 9875, 10067,
             10167, 16969, 11223, 22222, 33333, 1170, 1509, 4000, 1024,
             7000, 53001, 5569, 666, 21544, 4321, 43210, 54321, 11000,
             1600, 1981, 6912, 69123, 1001, 5000, 5001, 50505, 30303,
             1207, 1807, 555, 1170, 2565, 1243, 6711, 6712, 6713, 6776,
             27374, 61466, 2140, 3150, 40412, 6400, 6000, 29891, 34324,
             3791, 2000, 2001, 30133, 33911 , 23456, 1234, 1245, 6669,
             1170, 12361, 12362, 3024, 4092, 5714, 5741, 5742, 2583, 1080,
             5550 );

# Trojans List.
@trojans = ("Acid Battery 1.0", "AimSpy", "Ambush", "Antigen",
            "AOLTrojan1.1", "Backdoo r, Transscout",
            "BackConstruction 1.2+1.5", "Back Orifice 2000",
            "Back Orifice 2000", "Back Orifice DLL", "Back Orifice",
            "Back Orifice", "BigGluck, TN", "Bla 1.1", "Bla",
            "Blade Runner", "Blade Runner", "Blade Runner",
            "BO Jammerkillah", "BOWhack", "Bugs", "Chupacabra, Logged!",
            "Coma Danny", "Deep Throat 1.0, The Invasor", "Deep Throat 1.0",
            "DeepThroat 2 & 3", "DeepThroat 2 & 3", "DeepThroat 2 & 3",
            "DeepThroat 2.0 & 3.0", "Delta", "Delta", "DeltaSourceDarkStar",
            "Der Spaeher 3", "Devil 1.03", "Doly Trojan", "Doly Trojan 1.1",
            "Doly Trojan 1.1+1.2", "Doly Trojan 1.35", "Doly Trojan 1.5",
            "Doly Trojan 1.6", "Eclipse2000", "Evil FTP-Ugly FTP",
            "Executor", "FileNail Danny", "Firehotcker", "Fore", "FTP99CMP",
            "GabanBus,NetBus", "GabanBus,NetBus", "Gatecrasher",
            "Gatecrasher", "GirlFriend", "GirlFriend", "Gjamer",
            "Hack?99 KeyLogger", "Hack'a'tack", "Hack'a'tack",
            "Hack City Ripper Pro", "Hack Office Armageddon",
            "Hackers Paradise, Masters Paradise", "Hackers Paradise",
            "Hidden port V2.0", "HVL Rat5", "ICKiller", "IcqTrojan",
            "IcqTrojan", "Illusion Mailer", "InCommand 1.0",
            "Indoctrination", "Phase Zero", "InI Killer", "Kuang",
            "Kuang2 The Virus", "Masters Paradise", "Masters Paradise",
            "Masters Paradise", "Masters Paradise", "Masters Paradise",
            "Maverick's Matrix", "Millenium", "Millennium", "NetBus 2 Pro",
            "NetMetropolitan 1.0 & 1.04", "NetMetropolitan 1.04",
            "NetMonitor", "NetMonitor", "NetMonitor", "NetMonitor",
            "NetMonitor", "NetSphere", "NetSphere", "NetSphere",
            "Netsphere Final", "NetSpy", "NetSpy DK", "Online Keylogger",
            "OOTLT", "Pass Ripper", "Phineas Phucker", "Portal of Doom",
            "Portal of Doom", "Portal of Doom", "Portal of Doom",
            "Portal of Doom", "Portal of Doom", "Portal of Doom",
            "Priority", "Progenic trojan", "Prosiak 0.47", "Prosiak",
            "Psyber Streaming Server", "Psyber Streaming Server",
            "Psyber Streaming Server", "Psyber Streaming Server",
            "Remote Grab", "Remote Window Shutdown", "Robo Hack",
            "Satanz Backdoor, Peur de Rien FTP", "Schwindler 1.82",
            "Schoolbus 1.0", "Schoolbus 1.6 & 2.0", "Schoolbus 1.6 & 2.0",
            "Senna Spy", "Shiva Burka", "ShockRave", "Shitheep",
            "Shitheep Danny", "Silencer, WebEx", "Sockets de Troie",
            "Sockets de Troie", "Sockets de Troie", "Socket 25", "SoftWar",
            "Spy Sender", "Stealth Spy", "Streaming Audio Trojan", "Striker",
            "SubSeven", "SubSeven", "SubSeven", "SubSeven", "SubSeven",
            "SubSeven 2.1", "Telecommando", "The Invasor", "The Invasor",
            "The Spy", "The tHing", "The tHing 1.6", "The Unexplained",
            "Tiny Telnet Server", "Total Eclypse 1.0", "Transscout",
            "TrojanCow", "Trojan Spirit 2001a", "Trojan Spirit 2001a",
            "Ugly Ftp", "Ultors Trojan", "Voodoo Doll", "Vampire", "Voice",
            "Whack-a-mole", "Whack-a-mole", "WinCrash", "WinCrash",
            "WinCrash", "WinCrash", "WinCrash", "Wincrash 2",
            "Wingate Socks Proxy", "Xtcp");

for ($z=0;$z<171;$z++) {
 $n=0;
 $po = @ports[$z];
 $tro = @trojans[$z];
 $socket = IO::Socket::INET->new(PeerPort => "$po",
                                 PeerAddr => $victim,
                                 Proto    => "tcp",
                                 Timeout  => $timeout) || $n++;
 close $socket;
 if ($n == 0) {
   print (" Possible Trojan: $tro at the port $po\n"); 
   $n==0;
   }
 }
