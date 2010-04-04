#!/bin/bash
#
# Search Listings from NZBMatrix
# by: MreDD
#
##
# Variables
# NZBMatrix API Download Link - SSL
LINK="https://nzbmatrix.com/api-nzb-details.php?"
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
    $CURL "${LINK}search=${SEARCH}&catid=${CATEGORYID}&num=${MAXRESULTS}&username={$USERNAME}&apikey=${APIKEY}" > $TMP/nzbsearch.txt
    SPLAT=$($CAT $TMP/nzbsearch.txt | tr -d ";")
if [ "$SPLAT" = "error:nothing_found" ]; then
    echo "NoFiles: No Files Found.."
elif [ "$SPLAT" = "error:invalid_login" ]; then
    echo "Username: There is a problem with the username you have provided."
elif [ "$SPLAT" = "error:invalid_api" ]; then
    echo "APIKey: There is a problem with the API Key you have provided."
elif [ "$SPLAT" = "error:invalid_nzbid" ]; then
    echo "NZBid: There is a problem with the NZBid supplied."
elif [ "$SPLAT" = "error:please_wait_x" ]; then
    echo "Wait: Please wait x seconds before retry."
elif [ "$SPLAT" = "error:vip_only" ]; then
    echo "VIP Only: NZBMatrix Offers Search to VIP Members Only."
elif [ "$SPLAT" = "error:disabled_account" ]; then
    echo "Account: User Account Disabled."
elif [ "$SPLAT" = "error:x_daily_limit" ]; then
    echo "Limit: You have reached the daily download limit of x."
elif [ "$SPLAT" = "error:no_nzb_found" ]; then
    echo "NoNZB: No NZB found."
else
#    echo "$SPLAT"
    echo -e "${LGY}Max Search Results ${R}(${T}${MAXRESULTS}${R}) "
    echo " "
    echo -e "One"
    echo -e "NZBTitle: `$CAT $TMP/nzbsearch.txt | grep "NZBNAME:" | cut -f 2 -d ":" | awk -F\| '{print $0}' | head -1 | tr -d ";"`"
    echo -e "NZBID: `$CAT $TMP/nzbsearch.txt | grep "NZBID:" | cut -f 2 -d ":" | head -1 | tr -d ";"`" 
    echo -e "Link: `$CAT $TMP/nzbsearch.txt | grep "LINK:" | cut -f 2 -d ":" | awk '{print "http://"$0}' | head -1 | tr -d ";"`"
    echo -e "Category: `$CAT $TMP/nzbsearch.txt | grep "CATEGORY:" | cut -f 2 -d ":" | awk '{print $1,"-",$3}' | head -1 | tr -d ";"`"
    echo -e "IndexDate: `$CAT $TMP/nzbsearch.txt | grep "INDEX_DATE:" | cut -f 2 -d ":" | awk '{print $0}' | head -1`"
    echo -e "Group: `$CAT $TMP/nzbsearch.txt | grep "GROUP:" | cut -f 2 -d ":" | awk '{print $0}' | head -1 | tr -d ";"`"
    CONVERTONE=$($CAT $TMP/nzbsearch.txt | grep "SIZE:" | cut -f 2 -d ":" | head -1 | tr -d ";" | cut -f 1 -d ".")
    echo -ne "FileSize: $(($CONVERTONE >> 20)) Mb"
    echo " "
    echo -e "Two"
    echo -e "NZBTitle: `$CAT $TMP/nzbsearch.txt | grep "NZBNAME:" | cut -f 2 -d ":" | awk -F\| '{print $0}' | head -2 | tail -1 | tr -d ";"`"
    echo -e "NZBID: `$CAT $TMP/nzbsearch.txt | grep "NZBID:" | cut -f 2 -d ":" | head -2 | tail -1 | tr -d ";"`"
    echo -e "Link: `$CAT $TMP/nzbsearch.txt | grep "LINK:" | cut -f 2 -d ":" | awk '{print "http://"$0}' | head -2 | tail -1 | tr -d ";"`"
    echo -e "Category: `$CAT $TMP/nzbsearch.txt | grep "CATEGORY:" | cut -f 2 -d ":" | awk '{print $1,"-",$3}' | head -2 | tail -1 | tr -d ";"`"
    echo -e "IndexDate: `$CAT $TMP/nzbsearch.txt | grep "INDEX_DATE:" | cut -f 2 -d ":" | awk '{print $0}' | head -2 | tail -1`"
    echo -e "Group: `$CAT $TMP/nzbsearch.txt | grep "GROUP:" | cut -f 2 -d ":" | awk '{print $0}' | head -2 | tail -1 | tr -d ";"`"
    CONVERTTWO=$($CAT $TMP/nzbsearch.txt | grep "SIZE:" | cut -f 2 -d ":" | head -2 | tail -1 |  tr -d ";" | cut -f 1 -d ".")
    echo -ne "FileSize: $(($CONVERTTWO >> 20)) Mb"
    echo " "
    echo -e "Three"
    echo -e "NZBTitle: `$CAT $TMP/nzbsearch.txt | grep "NZBNAME:" | cut -f 2 -d ":" | awk -F\| '{print $0}' | tail -1 | tr -d ";"`"
    echo -e "NZBID: `$CAT $TMP/nzbsearch.txt | grep "NZBID:" | cut -f 2 -d ":" | tail -1 | tr -d ";"`"
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

