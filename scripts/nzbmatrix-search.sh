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
    echo "Categories Apps - Anime - Games - Movies - Music - TV - Everything"
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
# Search
    $CURL "https://nzbmatrix.com/api-nzb-search.php?search=${SEARCH}&catid=${CATEGORYID}&num=${MAXRESULTS}&username={$USERNAME}&apikey=${APIKEY}" > $TMP/nzbsearch.txt
    SPLAT=$($CAT $TMP/nzbsearch.txt | tr -d ";")
if [ "$SPLAT" = "error:nothing_found" ]; then
    echo "No Files Found.."
else
    echo "$SPLAT"

fi
fi
exit 0

