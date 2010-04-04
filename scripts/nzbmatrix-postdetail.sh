#!/bin/bash
#
# NZB Post Details from NZBMatrix
# by: MreDD
#
##
# NZBMatrix API Download Link
MATRIX="http://nzbmatrix.com/api-nzb-details.php?"
# Variables
# Curl - Path to Curl
CURL="/usr/bin/curl"
# Elinks - Path to Elinks
ELINKS="/usr/bin/elinks"
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
NZBID="$@"
if [ -z "$NZBID" ]; then
    echo "Post Details needs the NZBid... "
    echo "User NZB-Search or NZB-Latest to retrieve ID"
    echo "Example: NZBID: 596240"
else
    unset response
sleep 2
# Search
    $CURL "${MATRIX}id=${NZBID}&username=${USERNAME}&apikey=${APIKEY}" > $TMP/nzbpostdetail.txt
#    $ELINKS "${MATRIX}id=${NZBID}&username=${USERNAME}&apikey=${APIKEY}" > $TMP/nzbpostdetail.txt
    SPLAT=$($CAT $TMP/nzbpostdetail.txt | tr -d ";")
if [ "$SPLAT" = "error:nothing_found" ]; then
    echo "NoFiles: No Files Found.."
elif [ "$SPLAT" = "error:invalid_login" ]; then
    echo "Username: There is a problem with the username you have provided."
elif [ "$SPLAT" = "error:invalid_api" ]; then
    echo "APIKey: There is a problem with the API Key you have provided."
elif [ "$SPLAT" = "error:invalid_nzbid" ]; then
    echo "NZBid: There is a problem with the NZBid supplied."
elif [ "$SPLAT" = "error:vip_only" ]; then
    echo "VIP Only: You need to be VIP or higher to access."
elif [ "$SPLAT" = "error:disabled_account" ]; then
    echo "Account: User Account Disabled."
elif [ "$SPLAT" = "error:no_nzb_found" ]; then
    echo "NoNZB: No NZB found."
else
#    echo -e "$SPLAT"
    echo -e "[ NZB Post Details ]"
sleep 2
    echo -e "NZBid: $NZBID" 
    echo -e "NZBName: `$CAT $TMP/nzbpostdetail.txt | grep "NZBNAME:" | sed 's/^NZBNAME://' | tr -d ";"`"
    echo -e "Subject: `$CAT $TMP/nzbpostdetail.txt | grep "USENET_SUBJECT:" | sed 's/^USENET_SUBJECT://' | tr -d ";"`"
    echo -e "Group: `$CAT $TMP/nzbpostdetail.txt | grep "GROUP:" | sed 's/^GROUP://' | tr -d ";"`"
    echo -e "IndexDate: `$CAT $TMP/nzbpostdetail.txt | grep "INDEX_DATE:" | sed 's/^INDEX_DATE://' | tr -d ";"`"
    echo -e "Link: `$CAT $TMP/nzbpostdetail.txt | grep "LINK:" | sed 's/^LINK://' | tr -d ";"`"
    echo -e "Comments: `$CAT $TMP/nzbpostdetail.txt | grep "COMMENTS:" | sed 's/^COMMENTS://' | tr -d ";"`"
    echo -e "Hits: `$CAT $TMP/nzbpostdetail.txt | grep "HITS:" | sed 's/^HITS://' | tr -d ";"`"
    echo -e "Parts: `$CAT $TMP/nzbpostdetail.txt | grep "PARTS:" | sed 's/^PARTS://' | tr -d ";"`"
    CONVERTONE=$($CAT $TMP/nzbpostdetail.txt | grep "SIZE:" | sed 's/^SIZE://' | cut -f 1 -d ".")
    echo -ne "FileSize: $(($CONVERTONE >> 20)) Mb"
    echo " "
fi
fi
exit 0
