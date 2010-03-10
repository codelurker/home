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
CS=`mocp -i | grep 'CurrentSec' | awk '{print $2}'`
TS=`mocp -i | grep 'TotalSec' | awk '{print $2}'`
PERCENT=`bc << EOF
100.0 * $CS / $TS
EOF
`

if [ "$INFO" == "State: STOP" ];then 
    echo -ne "${K}MOC${T}: ${P}[${T}stop${P}] "
    echo ""
elif [ "$STATE" == "State: PAUSE" ];then 
    echo -ne "${K}MOC${T}:${LGY} |${T}pause${LGY}| "
    echo ""
else
PBARS=$(expr $PERCENT / 10 | cut -c01-01)
#
case $PBARS in
        0)
                PBAR=$(echo -e "${R}[${G}${BK}>${TR}${C}---------${R}]")
                ;;        
        1)
                PBAR=$(echo -e "${R}[${G}${BK}o${TR}${C}---------${R}]")
                ;;
        2)
                PBAR=$(echo -e "${R}[${C}-${G}${BK}o${TR}${C}--------${R}]")
                ;;
        3)
                PBAR=$(echo -e "${R}[${C}--${G}${BK}o${TR}${C}-------${R}]")
                ;;
        4)
                PBAR=$(echo -e "${R}[${C}---${G}${BK}o${TR}${C}------${R}]")
                ;;
        5)
                PBAR=$(echo -e "${R}[${C}----${G}${BK}o${TR}${C}-----${R}]")
                ;;
        6)
                PBAR=$(echo -e "${R}[${C}-----${G}${BK}o${TR}${C}----${R}]")
                ;;
        7)
                PBAR=$(echo -e "${R}[${C}------${G}${BK}o${TR}${C}---${R}]")
                ;;
        8)
                PBAR=$(echo -e "${R}[${C}-------${G}${BK}o${TR}${C}--${R}]")
                ;;
        9)
                PBAR=$(echo -e "${R}[${C}--------${G}${BK}o${TR}${C}-${R}]")
                ;;
        10)
                PBAR=$(echo -e "${R}[${C}---------${G}${BK}O${TR}${R}]")
                ;;
        *)
                PBAR=$(echo -e "${R}[${G}${BK}oooooooooo${TR}${R}]")
esac
##
# Vol-Bar
VOLUME=$(amixer sget 'PCM' | tail -n 1 | awk '{print $5}' | tr -d []%)
VBARS=$(expr $VOLUME / 10)
case $VBARS in
        1)
                VBAR=$(echo -e "${R})[${C}|${K}---------${R}]")
                ;;
        2)
                VBAR=$(echo -e "${R}[${C}||${K}--------${R}]")
                ;;
        3)
                VBAR=$(echo -e "${R}[${C}|||${K}-------${R}]")
                ;;
        4)
                VBAR=$(echo -e "${R}[${C}||||${K}------${R}]")
                ;;
        5)
                VBAR=$(echo -e "${R}[${C}|||||${K}-----${R}]")
                ;;
        6)
                VBAR=$(echo -e "${R}[${C}||||||${K}----${R}]")
                ;;
        7)
                VBAR=$(echo -e "${R}[${C}|||||||${K}---${R}]")
                ;;
        8)
                VBAR=$(echo -e "${R}[${C}||||||||${K}--${R}]")
                ;;
        9)
                VBAR=$(echo -e "${R}[${C}|||||||||${K}-${R}]")
                ;;
        10)
                VBAR=$(echo -e "${R}[${C}||||||||||${R}]")
                ;;
        *)
                VBAR=$(echo -e "${R}[${K}----------${R}]")
esac
STATE="$VOLUME"
if [ $STATE == "0" ]; then
    VOL="Muted${T}: $VBAR"
else
    VOL="${G}Vol${RT}${C}: $VBAR"
fi 
VOLBAR=$(~/.wmii-hg/scripts/vol-bar.sh)
echo -ne "${W}np${C}:${G}$ARTIST ${C}-${B}$TITLE ${C}|${G}$ALBUM $PBAR ${B}(${W}$PERCENT${R}%${B}) $VOL"
echo ""
fi
