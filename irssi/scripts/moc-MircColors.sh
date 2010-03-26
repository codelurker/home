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
W='\x0300' # White
K='\x0301' # Black
B='\x0302' # Blue (Navy)
G='\x0303' # Green
R='\x0304' # Red
BN='\x0305' # Brown (Maroon)
P='\x0306' # Purple
O='\x0307' # Orange
Y='\x0308' # Yellow
LG='\x0309' # Lt. Green
T='\x0310' # Teal
LC='\x0311' # Lt. Cyan
LB='\x0312' # Lt. Blue
PN='\x0313' # Pink
GY='\x0314' # Grey
LGY='\x0315' # Lt. Grey
# Background
BW=',00' # Background White
BK=',01' # Background Black
BB=',02' # Background Blue
BG=',03' # Background Green
BR=',04' # Background Red
BBN=',05' # Background Brown (Maroon)
BP=',06' # Background Purple
BO=',07' # Background Orange
BY=',08' # Background Yellow
BLG=',09' # Background Lt. Green
BT=',10' # Background Teal
BLC=',11' # Background Lt. Cyan
BLC=',12' # Background Lt. Blue
BPN=',13' # Background Pink
BGY=',14' # Background Grey
BLGY=',15' # Background Lt. Grey
# Various
BLD='\x02' # Bold
UL='\x1f' # Underlined
FL='\x06' # Flashing
RT='\x03\x02\x02' # Reset Text
# Variables
INFO=`mocp -i`
STATE=`mocp -i | grep State`
ARTIST=`mocp -i | grep Artist | cut -f2 -d ":"`
TITLE=`mocp -i | grep SongTitle | cut -f2 -d ":"`
ALBUM=`mocp -i | grep Album | cut -f2 -d ":"`
CT=`mocp -i | grep 'CurrentTime' | awk '{print $2}'`
TT=`mocp -i | grep 'TotalTime' | awk '{print $2}'`
BITRATE=`mocp -i | grep Bitrate | cut -f2 -d ":"`
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
                PBAR=$(echo -e "${R}[${T}-${RT}${PN}>${R}]")
                ;;        
        1)
                PBAR=$(echo -e "${R}[${T}+${RT}${PN}>${R}]")
                ;;
        2)
                PBAR=$(echo -e "${R}[${T}++${RT}${PN}>${R}]")
                ;;
        3)
                PBAR=$(echo -e "${R}[${T}+++${RT}${PN}>${R}]")
                ;;
        4)
                PBAR=$(echo -e "${R}[${T}++++${RT}${PN}>${R}]")
                ;;
        5)
                PBAR=$(echo -e "${R}[${T}+++++${RT}${PN}>${R}]")
                ;;
        6)
                PBAR=$(echo -e "${R}[${T}++++++${RT}${PN}>${R}]")
                ;;
        7)
                PBAR=$(echo -e "${R}[${T}+++++++${RT}${PN}>${R}]")
                ;;
        8)
                PBAR=$(echo -e "${R}[${T}++++++++${RT}${PN}>${R}]")
                ;;
        9)
                PBAR=$(echo -e "${R}[${T}+++++++++${RT}${PN}>${R}]")
                ;;
        10)
                PBAR=$(echo -e "${R}[${T}++++++++++${RT}${PN}>${R}]")
                ;;
        *)
                PBAR=$(echo -e "${R}[${PN}<${T}${BK}----------${PN}>${RT}${R}]")
esac
##
# Vol-Bar
VOLUME=$(amixer sget 'PCM' | tail -n 1 | awk '{print $5}' | tr -d []%)
VBARS=$(expr $VOLUME / 10)
case $VBARS in
        1)
                VBAR=$(echo -e "${R})[${T}|${K}---------${R}]")
                ;;
        2)
                VBAR=$(echo -e "${R}[${T}||${K}--------${R}]")
                ;;
        3)
                VBAR=$(echo -e "${R}[${T}|||${K}-------${R}]")
                ;;
        4)
                VBAR=$(echo -e "${R}[${T}||||${K}------${R}]")
                ;;
        5)
                VBAR=$(echo -e "${R}[${T}|||||${K}-----${R}]")
                ;;
        6)
                VBAR=$(echo -e "${R}[${T}||||||${K}----${R}]")
                ;;
        7)
                VBAR=$(echo -e "${R}[${T}|||||||${K}---${R}]")
                ;;
        8)
                VBAR=$(echo -e "${R}[${T}||||||||${K}--${R}]")
                ;;
        9)
                VBAR=$(echo -e "${R}[${T}|||||||||${K}-${R}]")
                ;;
        10)
                VBAR=$(echo -e "${R}[${T}||||||||||${R}]")
                ;;
        *)
                VBAR=$(echo -e "${R}[${K}----------${R}]")
esac
STATE="$VOLUME"
if [ $STATE == "0" ]; then
    VOL="Muted${T}: $VBAR"
else
    VOL="${LG}Vol${RT}${T}: $VBAR"
fi 
VOLBAR=$(~/.wmii-hg/scripts/vol-bar.sh)
echo -ne "${W}np${T}:${BN}$ARTIST ${T}-${LGY}$TITLE ${T}|${BN}$ALBUM $PBAR ${LGY}(${W}$PERCENT${R}%${LGY}) $VOL"
echo ""
fi
