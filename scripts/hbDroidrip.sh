#!/bin/bash
#
# Simple Motorola Android Encoder Using
#   HandbrakeCLI
# By: MreDD
# projects - @ - 0tue0.com
#
#
# Set Location of Source File 
input=''
# Set Title Track to encode
title='1'
# Set Video encoder [x264, ffmpeg, xvid, theora]
videoencoder='x264'

## add as many audio as you want! the dvds the limit just add new lines ## example AID4= ##
# then copy an paste the audio lines an change to 4 or what number needed
###################
##
### Various x264 options - Read the comments and choose what you want.

## Android Quality
x264opts='level=30:bframes=0:cabac=0:ref=6:vbv-maxrate=350:vbv-bufsize=2000:analyse=all:me=umh:no-fast-pskip=1'
## Custom Line
#x264opts=''

# Set Framerate [5, 10, 12, 15, 23.976, 24, 25, 29.97]
#vrate='29.97'
### add back
#          -r $vrate \
# Set Bitrate
bitrate='1500'
# Set Audio Tracks to encode ["1,2,3"]
audio='1'
# Set Audio Name ["Main Audio","Downmixed Audio","Director's Commentary"]
aname='"English"'
# Set Audio encoder [faac, lame, vorbis, ac3]
audioencoder='faac'
# Set Audio Samplerrate
arate='48'
# Set Audio Bitrate
audiobitrate='160'
# Set Formate for Surround Sound [auto, mono, stereo, dp11, dp12, 6ch]
mixdown='6ch'
# File ext Format [mkv, mp4]
format='mp4'
# Set Save Location
output=''
# Set File Size - Bitrate Can Control Size
size='450'
# Set Max Height
mheight='480'
# Set Max Width
mwidth='854'
### add back
#          -Y $mheight \
#          -X $mwidth \

# Add Chapter makers to mp4 and mkv by adding -m
markers='-m'
# Add Subtitle add -s <number>
#subtitle='1'

#Add a path to working directory
cd change/me/to/a/proper/path
sleep 2
echo " ...Starting HandBrakeCLI Rip... "
sleep 1
#
HandBrakeCLI -i $input -o $output.$format $markers \
          -t $title \
          -e $videoencoder \
          -x $x264opts \
          -b $bitate \
          -a $audio \
          -A $aname \
          -E $audioencoder \
          -R $arate \
          -B $audiobitrate \
          -6 $mixdown \
          -f $format \
          -Y $mheight \
          -X $mwidth \
          -2 -T \
          -S $size 

echo " ...Done... "

