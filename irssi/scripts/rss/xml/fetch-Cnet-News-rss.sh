#!/bin/sh
# Fetch RSS from XML
# by: T3slider

# CNet News
URL="http://news.cnet.com/2547-11386_3-0-5.xml"

curl --silent "$URL" | grep -A 13 "<item>" | grep -v "^--$" | sed 's/^[ \t]*//;s/.$//g' | grep -v "^$\|<description>$\|</description>$" | sed 's/^[^<].*/<description>&<\/description>/g' | head -8
