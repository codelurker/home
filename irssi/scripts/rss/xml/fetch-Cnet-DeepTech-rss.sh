#!/bin/sh
# Fetch RSS from XML
# by: T3slider

# CNet DeepTech
URL="http://news.cnet.com/8300-30685_3-264.xml"

curl --silent "$URL" | grep -A 13 "<item>" | grep -v "^--$" | sed 's/^[ \t]*//;s/.$//g' | grep -v "^$\|<description>$\|</description>$" | sed 's/^[^<].*/<description>&<\/description>/g' | head -8
