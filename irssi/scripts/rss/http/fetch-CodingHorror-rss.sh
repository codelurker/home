#!/bin/sh
# Fetch RSS from XML
# by: T3slider

RSSDIR="$HOME/.irssi/scripts/rss"
# Coding Horror
URL="http://feeds.feedburner.com/codinghorror"

#wget --quiet -O - "$URL" | grep -A 13 "<item>" | grep -v "^--$" | sed 's/^[ \t]*//;s/.$//g' | grep -v "^$\|<description>$\|</description>$" | sed 's/^[^<].*/<description>&<\/description>/g' | head -8
wget --quiet -O - "$URL" | xsltproc $RSSDIR/file.xsl - | sed 's/<.*//g;s/^[ \t]*//g;/^$/d' | tail -4
