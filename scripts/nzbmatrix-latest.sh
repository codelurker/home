#!/bin/bash
#
# Fetch Latest Listings from NZBMatrix
# by: MreDD
##
# Variables
# ELinks - Path to ELinks
ELINKS="/usr/bin/elinks"
# Cat - Path to Cat
CAT="/bin/cat"
# UserID - Add it Here
USERID=""
# APIKey - Add it Here
APIKEY=""
# Temp Folder Path
TMP="$HOME/tmp"

# Fetch Info
SEARCH="$@"
if [ -z "$SEARCH" ]; then
    echo -e "${T}Provide a Search Category, ${R}Choices ${W}- ${P}Apps ${W}- ${BN}Anime ${W}- ${G}Games ${W}- Movies ${W}- ${B}Music ${W}- ${LB}TV"
    echo ""
else
    unset response
# Fetch Latest
    $ELINKS -dump -dump-width 300 "http://rss.nzbmatrix.com/rss.php?cat=${SEARCH}&userid=${USERID}&apikey=${APIKEY}" > $TMP/nzblatest.txt
    echo -ne "Searching in $SEARCH @ NZBMatrix${RT}${PN}..."
    echo ""
   $CAT $TMP/nzblatest.txt | grep "Name" | awk '{print $3,$4,$5,$6,$7,$8,$9,$10,$11,"-",$1}'
fi
exit 0
