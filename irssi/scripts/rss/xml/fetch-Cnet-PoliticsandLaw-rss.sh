#!/bin/sh
# Fetch RSS from XML
# by: T3slider

# CNet Politics & Law
URL="http://news.cnet.com/8300-13578_3-38.xml"

curl --silent "$URL" | grep -A 13 "<item>" | grep -v "^--$" | sed 's/^[ \t]*//;s/.$//g' | grep -v "^$\|<description>$\|</description>$" | sed 's/^[^<].*/<description>&<\/description>/g' | head -8
