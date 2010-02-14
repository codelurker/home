#!/bin/bash
# Vol Bar
# MreDD
#############
VOLUME=$(amixer sget 'PCM' | tail -n 1 | awk '{print $5}' | tr -d []%)
VBARS=$(expr $VOLUME / 10)
case $VBARS in
        1)
                VBAR='[|---------]'
                ;;
        2)
                VBAR='[||--------]'
                ;;
        3)
                VBAR='[|||-------]'
                ;;
        4)
                VBAR='[||||------]'
                ;;
        5)
                VBAR='[|||||-----]'
                ;;
        6)
                VBAR='[||||||----]'
                ;;
        7)
                VBAR='[|||||||---]'
                ;;
        8)
                VBAR='[||||||||--]'
                ;;
        9)
                VBAR='[|||||||||-]'
                ;;
        10)
                VBAR='[||||||||||]'
                ;;
        *)
                VBAR='[----------]'
esac
STATE="$VOLUME"
if [ $STATE == "0" ]; then
    VOL="Muted: $VBAR"
else
    VOL="Vol: $VBAR"
fi
echo -e $VOL

