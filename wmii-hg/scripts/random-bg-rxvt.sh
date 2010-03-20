#!/bin/bash
# Random Background for rxvt for MOC
image="$(ls $HOME/images/wallpapers/rxvt-random | sort -R | tail -1)"
urxvt -pixmap $HOME/images/wallpapers/rxvt-random/$image\; -title MOC -fn 'xft:Liberation Mono:pixelsize=12:antialias=true:hinting=true' -e mocp
