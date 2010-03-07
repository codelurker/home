#!/bin/bash
# Now Playing MOC Script
# By: MreDD
# mredd (at) 0tue0.com
# Small script to echo 
# Stop | Pause | and What MOC is playing Artist - Song CT/TT - VolBar
# for use w/IRC Apps.. Spam Your Music
#########

# Colors
# Forground
K='\E[0;30m' # Black - Regular
R='\E[0;31m' # Red
G='\E[0;32m' # Green
Y='\E[0;93m' # Yellow
B='\E[0;34m' # Blue
P='\E[0;35m' # Purple
C='\E[0;36m' # Cyan
W='\E[0;37m' # White
O='\E[0;33m' # Orange
# Bold
BK='\E[1;30m' # Black - Bold
BR='\E[1;31m' # Red
BG='\E[1;32m' # Green
BY='\E[1;93m' # Yellow
BB='\E[1;34m' # Blue
BP='\E[1;35m' # Purple
BC='\E[1;36m' # Cyan
BW='\E[1;37m' # White
BO='\E[1;33m' # Orange
# Underline
UK='\E[4;30m' # Black - Underline
UR='\E[4;31m' # Red
UG='\E[4;32m' # Green
UW='\E[4;93m' # Yellow
UB='\E[4;34m' # Blue
UP='\E[4;35m' # Purple
UC='\E[4;36m' # Cyan
UW='\E[4;37m' # White
UO='\E[4;33m' # Orange
# Background
BGK='\E[40m'   # Black - Background
BGR='\E[41m'   # Red
BGG='\E[42m'   # Green
BGY='\E[93m'   # Yellow
BGB='\E[44m'   # Blue
BGP='\E[45m'   # Purple
BGC='\E[46m'   # Cyan
BGW='\E[47m'   # White
BGO='\E[33m'   # Orange
TR='\E[0m'    # Text Reset
# Variables
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`
ALBUM=`mocp -i | grep Album | cut -f2 -d ":"`
CT=`mocp -i | grep 'CurrentTime' | awk '{print $2}'`
TT=`mocp -i | grep 'TotalTime' | awk '{print $2}'`
BITRATE=`mocp -i | grep Bitrate | cut -f2 -d ":"`
##
# Vol-Bar
VOLUME=$(amixer sget 'PCM' | tail -n 1 | awk '{print $5}' | tr -d []%)
VBARS=$(expr $VOLUME / 10)
case $VBARS in
        1)
                VBAR=$(echo -e "${O})[${P}|${K}---------${O}]")
                ;;
        2)
                VBAR=$(echo -e "${O}[${P}||${K}--------${O}]")
                ;;
        3)
                VBAR=$(echo -e "${O}[${P}|||${K}-------${O}]")
                ;;
        4)
                VBAR=$(echo -e "${O}[${P}||||${K}------${O}]")
                ;;
        5)
                VBAR=$(echo -e "${O}[${P}|||||${K}-----${O}]")
                ;;
        6)
                VBAR=$(echo -e "${O}[${P}||||||${K}----${O}]")
                ;;
        7)
                VBAR=$(echo -e "${O}[${P}|||||||${K}---${O}]")
                ;;
        8)
                VBAR=$(echo -e "${O}[${P}||||||||${K}--${O}]")
                ;;
        9)
                VBAR=$(echo -e "${O}[${P}|||||||||${K}-${O}]")
                ;;
        10)
                VBAR=$(echo -e "${O}[${P}||||||||||${O}]")
                ;;
        *)
                VBAR=$(echo -e "${O}[${K}----------${O}]")
esac
STATE="$VOLUME"
if [ $STATE == "0" ]; then
    VOL="Muted: $VBAR"
else
    VOL="Vol: $VBAR"
fi 
VOLBAR=$(~/.wmii-hg/scripts/vol-bar.sh)

if [ "$INFO" == "State: STOP" ];then echo -ne "${K}MOC${O}: ${P}[${K}stop${P}] "
elif [ "$STATE" == "State: PAUSE" ];then echo -ne "${K}MOC${R}:${LGY} |${GY}pause${LGY}| "
else 
echo -ne "${W}np${K}:${C}$ARTIST ${P}-${LGY}$TITLE ${P}|${C}$ALBUM "${R}["${LGY}$CT${R}/${P}$TT"${R}]" $VOL"
echo ""
fi
