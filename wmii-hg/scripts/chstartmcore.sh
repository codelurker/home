#!/bin/sh
# Check - Start MCore Script - Conky
#
# Variables
PROCESS="$(ps aux | grep 'conky -c /home/mredd/.conkyrc' | grep -v grep|wc -l)"
#
if [ "$PROCESS" == "0" ];then
      conky -c ~/.conkyrcore > ~/.conkywmii &
else
      echo "MCore Conky CheckOnline"
fi
