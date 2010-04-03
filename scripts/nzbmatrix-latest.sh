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
USERID=`cat $HOME/.nzbmatrixrc | awk '{print $3}'`
# APIKey - Add it Here
APIKEY=`cat $HOME/.nzbmatrixrc | awk '{print $9}'`
# Temp Folder Path
TMP="$HOME/tmp"

# Fetch Info
SEARCH="$@"
if [ -z "$SEARCH" ]; then
    echo -e "Provide a Search Category, Choices - Apps - Anime - Games - Movies - Music - TV"
    echo ""
else
    unset response
# Fetch Latest
    $ELINKS -dump -dump-width 300 "http://rss.nzbmatrix.com/rss.php?cat=${SEARCH}&userid=${USERID}&apikey=${APIKEY}" > $TMP/nzblatest.txt
    echo -e "Searching in $SEARCH @ NZBMatrix..."
    echo ""
SPLAT="$($CAT $TMP/nzblatest.txt | grep "Name" | awk '{print $3,$4,$5,$6,$7,$8,$9,$10,$11,"-",$1}')"
if [ "$SPLAT" = "error:nothing_found" ]; then
    echo "No Files Found.."
elif [ "$SPLAT" = "error:vip_only" ]; then
    echo "VIP Only: NZBMatrix Offers Search to VIP Members Only"
else
    echo -e "$SPLAT"
fi
fi
exit 0
