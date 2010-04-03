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
    echo -e "Provide a Search Category | Categories - Apps - Anime - Games - Movies - Music - TV"
    echo ""
else
    unset response
# Fetch Latest
    $ELINKS -dump -dump-width 600 "http://rss.nzbmatrix.com/rss.php?cat=${SEARCH}&userid=${USERID}&apikey=${APIKEY}" > $TMP/nzblatest.txt
    echo -ne "Searching in $SEARCH @ NZBMatrix..."
    echo ""
SPLAT="$($CAT $TMP/nzblatest.txt | grep "Name" | awk '{print $3,$4,$5,$6,$7,$8,$9,$10,$11,"-",$1}')"
if [ "$SPLAT" = "error:nothing_found" ]; then
    echo "No Files Found.."
else
    echo -e "$SPLAT"
fi
fi

exit 0
