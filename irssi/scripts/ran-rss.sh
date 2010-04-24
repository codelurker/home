#!/bin/bash
# Random RSS XSL Feed Bot
VER="0.1"
# by: MreDD
#  with help from T3slider
##

# Path to RSS Scripts
RSS="$HOME/.irssi/scripts/rss/scripts"
# Path to TMP
TMP="$HOME/tmp"
# Random Select Script
SCRIPTS=($RSS/*.sh) 
N=${#SCRIPTS[@]}
 ((N=RANDOM%N)) 
RANDOMRSS=${SCRIPTS[$N]}
sh $RANDOMRSS
