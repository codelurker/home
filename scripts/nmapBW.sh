#!/bin/bash
# nmapbw-0.1
# small wrapper to NMap
# By: MreDD
##

#error handling
error_msg(){
    echo "$PROG: ERROR: $*" | fold >&2
    } 

#check for nmap
which nmap >/dev/null 2>&1  ||
{ error_msg "Cannot find 'nmap', which is needed for this script."
          exit 1;} 

menu ()
{     
#The Menu
        

	clear;

        echo "-----NMap-Bash-Wrapper-----"
        echo "-----------MENU------------"
        echo ""
        echo "1 Host Discovery"
        echo "2 OS Detection"
        echo "3 Intense Scan"
        echo "4 Intense Scan UDP"
        echo "5 Intense Scan TCP"
        echo "6 Intense Scan No Ping"
        echo "7 Ping Scan"
        echo "8 Quick Scan"
        echo "9 Quick Scan Plus"
        echo "10 Quick Scan Traceroute"
        echo "11 Slow Comprehensive Scan"
        echo "12 Custom Scan"
        echo "13 Exit"
        echo ""
        echo " Some Commands Require Root Privies..."
        echo ""
}       
        menu

	read -p "Hello $(whoami), what would you like me to do? " choice
       
        while [[ "$choice" != "0" ]]
        do
           case $choice in
             1)  clear;
                 read -p "Enter Target(s): " target
                 clear;
                 nmap $target;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             2)  clear;
                 read -p "Enter Target(s): " target2
                 nmap -O $target2;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             3)  clear;
                 read -p "Enter Target(s): " target3
                 nmap -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 $target3;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             4)  clear;
                 read -p "Enter Target(s): " target4
                 nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 $target4;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             5)  clear;
                 read -p "Enter Target(s): " target5
                 nmap -p 1-65535 -T4 -A -v -PE -PS22,25,80 -PA21,23,80,3389 $target5;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             6)  clear;
                 read -p "Enter Target(s): " target6
                 nmap -T4 -A -v -PN $target6;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             7)  clear;
                 read -p "Enter Target(s): " target7
                 nmap -sP -PE -PA21,23,80,3389 $target7;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;; 
             8)  clear;
                 read -p "Enter Target(s): " target8
                 nmap -T4 -F $target8;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             9)  clear;
                 read -p "Enter Target(s): " target9
                 nmap -sV -T4 -O -F --version-light $target9;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;      
             10)  clear;
                 read -p "Enter Target(s): " target10
                 nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute $target10;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             11)  clear;
                 read -p "Enter Target(s): " target11
                 nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all $target11;
		 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
                 ;;
             12)  clear;
                 read -p "Enter Custom Scan String: " cust
                 read -p "Enter Target(s): " target12
                 nmap $cust $target121;
                 echo
		 read -p "Scan Complete!  Press Enter to Return to the Menu." deadArg;
		 ;;           
             13)  clear;
                 echo "Thanks $(whoami)!"
                 exit;
                 ;;

             *)  clear;
                 echo "You have entered an invalid option!"
                 read -p "Press enter to continue." deadArg
                 ;;
	   esac
	   	
	   # menu again
   
	   menu
            read -p "Hello $(whoami), what would you like me to do? " choice
      done 
