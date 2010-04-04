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
USERNAME=`cat $HOME/.nzbmatrixrc | awk '{print $6}'`
# APIKey - Add it Here
APIKEY=`cat $HOME/.nzbmatrixrc | awk '{print $9}'`
# Temp Folder Path
TMP="$HOME/tmp"
# Max Results
MAXRESULTS="3"


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
elif [ "$SPLAT" = "error:vip_only" ]; then
    echo "VIP Only: NZBMatrix Offers Search to VIP Members Only"
else
#    echo "$SPLAT"
    echo "Max Search Results (${MAXRESULTS}) "
    echo " "
    echo "One"
    echo -e "NZBTitle: `$CAT $TMP/nzbsearch.txt | grep "NZBNAME:" | cut -f 2 -d ":" | awk -F\| '{print $0}' | head -1 | tr -d ";"`"
    echo -e "Link: `$CAT $TMP/nzbsearch.txt | grep "LINK:" | cut -f 2 -d ":" | awk '{print "http://"$0}' | head -1 | tr -d ";"`"
    echo -e "Category: `$CAT $TMP/nzbsearch.txt | grep "CATEGORY:" | cut -f 2 -d ":" | awk '{print $1,"-",$3}' | head -1 | tr -d ";"`"
    echo -e "IndexDate: `$CAT $TMP/nzbsearch.txt | grep "INDEX_DATE:" | cut -f 2 -d ":" | awk '{print $0}' | head -1`"
    echo -e "Group: `$CAT $TMP/nzbsearch.txt | grep "GROUP:" | cut -f 2 -d ":" | awk '{print $0}' | head -1 | tr -d ";"`"
    CONVERTONE=$($CAT $TMP/nzbsearch.txt | grep "SIZE:" | cut -f 2 -d ":" | head -1 | tr -d ";" | cut -f 1 -d ".")
    echo -ne "FileSize: $(($CONVERTONE >> 20)) Mb"
    echo " "
    echo "Two"
    echo -e "NZBTitle: `$CAT $TMP/nzbsearch.txt | grep "NZBNAME:" | cut -f 2 -d ":" | awk -F\| '{print $0}' | head -1 | tail -1 | tr -d ";"`"
    echo -e "Link: `$CAT $TMP/nzbsearch.txt | grep "LINK:" | cut -f 2 -d ":" | awk '{print "http://"$0}' | head -1 | tail -1 | tr -d ";"`"
    echo -e "Category: `$CAT $TMP/nzbsearch.txt | grep "CATEGORY:" | cut -f 2 -d ":" | awk '{print $1,"-",$3}' | head -1 | tail -1 | tr -d ";"`"
    echo -e "IndexDate: `$CAT $TMP/nzbsearch.txt | grep "INDEX_DATE:" | cut -f 2 -d ":" | awk '{print $0}' | head -1 | tail -1`"
    echo -e "Group: `$CAT $TMP/nzbsearch.txt | grep "GROUP:" | cut -f 2 -d ":" | awk '{print $0}' | head -1 | tail -1 | tr -d ";"`"
    CONVERTTWO=$($CAT $TMP/nzbsearch.txt | grep "SIZE:" | cut -f 2 -d ":" | head -1 | tail -1 |  tr -d ";" | cut -f 1 -d ".")
    echo -ne "FileSize: $(($CONVERTTWO >> 20)) Mb"
    echo " "
    echo "Three"
    echo -e "NZBTitle: `$CAT $TMP/nzbsearch.txt | grep "NZBNAME:" | cut -f 2 -d ":" | awk -F\| '{print $0}' | tail -1 | tr -d ";"`"
    echo -e "Link: `$CAT $TMP/nzbsearch.txt | grep "LINK:" | cut -f 2 -d ":" | awk '{print "http://"$0}' | tail -1 | tr -d ";"`"
    echo -e "Category: `$CAT $TMP/nzbsearch.txt | grep "CATEGORY:" | cut -f 2 -d ":" | awk '{print $1,"-",$3}' | tail -1 | tr -d ";"`"
    echo -e "IndexDate: `$CAT $TMP/nzbsearch.txt | grep "INDEX_DATE:" | cut -f 2 -d ":" | awk '{print $0}' | tail -1`"
    echo -e "Group: `$CAT $TMP/nzbsearch.txt | grep "GROUP:" | cut -f 2 -d ":" | awk '{print $0}' | tail -1 | tr -d ";"`"
    CONVERTTHREE=$($CAT $TMP/nzbsearch.txt | grep "SIZE:" | cut -f 2 -d ":" | tail -1 |  tr -d ";" | cut -f 1 -d ".")
    echo -ne "FileSize: $(($CONVERTTHREE >> 20)) Mb"
    echo " "
fi
fi
exit 0

