#!/bin/bash
# Random RSS Feed Bot
VER="0.1"
# by: MreDD
#  with help from T3slider
##

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


# Path to RSS Scripts
RSS="$HOME/.irssi/scripts/rss/xml"
# Path to TMP
TMP="$HOME/tmp"
# Random Select Script
SCRIPTS=($RSS/*.sh) 
N=${#SCRIPTS[@]}
 ((N=RANDOM%N)) 
RANDOMRSS=${SCRIPTS[$N]}
sh $RANDOMRSS > $TMP/null
#
# Variables
TITLE=$(sh $RANDOMRSS -1 | grep "title" | cut -f 2 -d ">" | cut -f 1 -d "<")
DESCRIPTION=$(sh $RANDOMRSS -1 | grep "description" | cut -f 2 -d ">" | cut -f 1 -d "<" | head -1)
LINK=$(sh $RANDOMRSS -1 | grep "guid" | cut -f 2 -d "<" | cut -f 2 -d ">")
#

if [ "$TITLE" = "" ];then
    echo -e "${R}No RSS Feed Found${W}... ${T}:("
else
    echo "Random RSS Feed..."
    echo ""
    echo -e "${T}$TITLE"
    echo -e "${LGY}$DESCRIPTION"
    echo -e "${LG}$LINK"
fi
exit 0
