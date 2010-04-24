#!/bin/sh
# Fetch RSS from XML
# by: T3slider

# New York Times
URL="http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml"

wget --quiet -O - "$URL" | grep -A 13 "<item>" | grep -v "^--$" | sed 's/^[ \t]*//;s/.$//g' | grep -v "^$\|<description>$\|</description>$" | sed 's/^[^<].*/<description>&<\/description>/g' | head -8
