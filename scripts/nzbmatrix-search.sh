#!/bin/bash
#
# Search Listings from NZBMatrix
# by: MreDD
#
##
# Variables
# Curl - Path to Curl
CURL="/usr/bin/curl"
# Cat - Path to Cat
CAT="/bin/cat"
# UserID - Add it Here
USERNAME=""
# APIKey - Add it Here
APIKEY=""
# Temp Folder Path
TMP="$HOME/tmp"
# Max Results
MAXRESULTS="3"
# Category
CATEGORYID="Everything"


# Fetch Info
SEARCH="$@"
if [ -z "$SEARCH" ]; then
    echo "Search Needs Category and searchterm... "
    echo "Category uses the c as a trigger Example: cMovies The Way the West was Won"
    echo " Example: cTV True Blood      |  Example: cAnime Akire"
else
    unset response
CATEGORYID=$(echo $1 | sed 's/^c//')
    shift
SEARCH=$(echo "$@" | tr ' ' '+')
    echo -e "Searching In Category $CATEGORYID"
    echo ""
    echo -e "Searching for $SEARCH"
    echo ""
sleep 2
# Fetch Latest
    $CURL "https://nzbmatrix.com/api-nzb-search.php?search=${SEARCH}&catid=${CATEGORYID}&num=${MAXRESULTS}&username={$USERNAME}&apikey=${APIKEY}" > $TMP/nzbsearch.txt
    SPLAT=$($CAT $TMP/nzbsearch.txt)
    echo "$SPLAT"

fi
exit 0

