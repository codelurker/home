#!/bin/bash
#
# x264 DvD Rip
# By: MreDD
# projects - @ - 0tue0.com
#
# Applications needed
# Mplayer - Mencoder   http://www.mplayerhq.hu/design7/dload.html
# dvdxchap - OGMTools  http://www.bunkus.org/videotools/ogmtools/ 
# x264                 http://www.videolan.org/developers/x264.html
# a52dec               http://liba52.sourceforge.net/
# faac                 http://sourceforge.net/projects/faac/
# mkvtoolnix           http://www.bunkus.org/videotools/mkvtoolnix/
# MediaInfo            http://mediainfo.sourceforge.net/en
# lsdvd                http://untrepid.com/acidrip/lsdvd.html
###################################
#
# you can get this nformation just by playing dvd with mplayer it dumps to terminal
# or use lsdvd - it's in most repos
#
# DEMO of Mplayer Dump
## Playing dvd://1.
## There are 27 titles on this DVD.
## There are 28 chapters in this DVD title.
## There are 1 angles in this DVD title.
## audio stream: 0 format: ac3 (5.1) language: de aid: 128.
## audio stream: 1 format: ac3 (stereo) language: en aid: 129.
## number of audio channels on disk: 2.
## subtitle ( sid ): 1 language: en
## subtitle ( sid ): 3 language: fr
## subtitle ( sid ): 5 language: es
## number of subtitles on disk: 3
####################################################

## Change Path to your tag
#Tag Helper
TAG='/mnt/p2/rip/tag.txt'

## you will want to change the path to fit your needs ##
#Because I use 2 dvd drives i set a device Path!!
DPATH='ChangeMe'

## Change
##add rip path here
RPATH='ChangeMe' 

## Change
#Film Title
TITLE="ChangeMe" 

## Change this ## leave your example ## crop=720:352:0:66 ## Comment Out if using iPod Profiles
#add crop ### get crop with mencoder dvd://changme -oac lavc -ovc lavc -vf cropdetect -o /dev/null #### uneeded for ipod touch - video lines ##
# Example
CROP='crop=720:480:0:0'

#Frames per Second
# Example
FPS='29.976'

## Change
#dvd track number
# Example
TRACK='6'     

## Change
#the bitrate you feel is best # use a bitrate calculator they help. Google.com
# Example
BITRATE='1467'                   

## Change
#audio 1
# Example
AID1='128'

## Change - uncomment
#audio 2
# Example
AID2='129'

## Change - uncomment
#audio 3
# Example
AID3='130'

## Change - uncomment
#audio 3
# Example
AID4='131'

## add as many audio as you want! the dvds the limit just add new lines ## example AID4= ##
# then copy an paste the audio lines an change to 4 or what number needed
###################
##
### Various x264 options - Read the comments and choose what you want.
#Test
#
XOPS='subq=6:partitions=all:8x8dct:me=umh:frameref=5:bframes=3:b_pyramid:weight_b:threads=auto'

#######################################
#Grabs and outputs dvd track chapter time marker - used with mp4box 
## Change the dvd device as needed ## example /dev/dvd or /dev/dvd2 ##
##change path to dvd as needed i have 2 dvd drives so i us both ##
echo "Grabbing Chapter Info"
sleep 2
#dvdxchap -t $TRACK $DPATH > $RPATH/chapters.txt  
echo ""

#rip title to harddrive
##############
#
echo "Ripping Title to Harddrive"
sleep 2
## Change the dvd device as needed ## example /dev/dvd or /dev/dvd2 ##
#mplayer -dvd-device $DPATH  dvd://$TRACK\
#        -dumpstream\
#        -dumpfile $RPATH/$TITLE.mpg 

echo "Finished Title to Harddrive"

#encode pass 1
##############
#
## Change the dvd device as needed ## example /dev/dvd or /dev/dvd2 ##
echo "Starting Encode Pass 1"
sleep 2    
## you need to swap -vf lines out for iPod touch video ##
#         -vf scale=576:320,dsize=576:320,harddup\  ## uncomment to use for ipod touch ##
#         -vf scale=640:480,dsize=640:480,harddup\  ## uncomment to use for ipod video ## 
#         -vf pullup,softskip,$CROP,harddup\        ## default line ##
#         -vf harddup,kerndeint,hqdn3d,scale=-10:-1 ##
#mencoder $RPATH/$TITLE.mpg -vf pullup,softskip,$CROP,harddup -of rawvideo -ovc x264 -x264encopts $XOPS:bitrate=1200:turbo=1:pass=1 -nosound -o /dev/null 

echo "Finished Encode Pass 1" 

#encode Pass 2
##############
#
echo "Starting Encode Pass 2" 
sleep 2
## you need to swap -vf lines out for iPod touch video ##
#         -vf scale=576:320,dsize=576:320,harddup\  ## uncomment to use for ipod touch ##
#         -vf scale=640:480,dsize=640:480,harddup\  ## uncomment to use for ipod video ## 
#         -vf pullup,softskip,$CROP,harddup\        ## default line ##   
#         -vf harddup,kerndeint,hqdn3d,scale=-10:-1 ##     
#mencoder $RPATH/$TITLE.mpg -vf pullup,softskip,$CROP,harddup -of rawvideo -ovc x264 -x264encopts $XOPS:bitrate=$BITRATE:pass=3 -nosound -o $RPATH/$TITLE.264 
echo "Finished Encode Pass 2"

#grabbing title audio
##############
#
echo "Starting Audio Conversion"
sleep 2
echo " DvD to AC3 Dump"

#mplayer $RPATH/$TITLE.mpg\
#        -aid $AID1\
#        -dumpaudio -dumpfile $RPATH/$TITLE-1.ac3 
         
#mplayer $RPATH/$TITLE.mpg\
#        -aid $AID2\
#        -dumpaudio -dumpfile $RPATH/$TITLE-2.ac3 
## uncomment to use
#mplayer $RPATH/$TITLE.mpg\
#        -aid $AID3\
#        -dumpaudio -dumpfile $RPATH/$TITLE-3.ac3 
## uncomment to use
#mplayer $RPATH/$TITLE.mpg\
#        -aid $AID4\
#        -dumpaudio -dumpfile $RPATH/$TITLE-4.ac3           

echo "Done.."

#convert ac3 to wav
##############
#
echo "Converting AC3 to WAVDolby"
sleep 2

#a52dec $RPATH/$TITLE-1.ac3\
#        -o wavdolby > $RPATH/$TITLE-1.wav 

## uncomment to use
#a52dec $RPATH/$TITLE-2.ac3\
#        -o wavdolby > $RPATH/$TITLE-2.wav

## uncomment to use
#a52dec $RPATH/$TITLE-3.ac3\
#        -o wavdolby > $RPATH/$TITLE-3.wav

## uncomment to use
#a52dec $RPATH/$TITLE-4.ac3\
#        -o wavdolby > $RPATH/$TITLE-4.wav            

echo "Finished Converting AC3 to WAVDolby"

#convert wav to aac
##############
#
echo "Converting  WAVDolby to AAC"
sleep 2

#faac $RPATH/$TITLE-1.wav $RPATH/$TITLE-1.aac -b 256 -q 100

## uncomment to use       
#faac $RPATH/$TITLE-2.wav $RPATH/$TITLE-2.aac -b 256 -q 100  

## uncomment to use 
#faac $RPATH/$TITLE-3.wav $RPATH/$TITLE-3.aac -b 256 -q 100 

## uncomment to use 
#faac $RPATH/$TITLE-4.wav $RPATH/$TITLE-4.aac -b 256 -q 100     

#echo "Finished with Audio Conversion"


#mkv conversion with MKVToolNix
##############
#
echo "Creating MKV File"
sleep 2

mkvmerge --title $TITLE -o $RPATH/$TITLE.mkv --chapters $RPATH/chapters.txt -add $RPATH/$TITLE.264 -add $RPATH/$TITLE-1.aac -add $RPATH/$TITLE-2.aac -add $RPATH/$TITLE-3.aac -add $RPATH/$TITLE-4.aac

## Add back audio lines as needed ##
#       -add $RPATH/$TITLE-2.aac\
#       -add $RPATH/$TITLE-3.aac\ 

#move subs an finished mp4 inside named directory
#
## uncomment when using SubRip
#mkdir $RPATH/$TITLE/;mv *-Subs/ $RPATH/$TITLE.mp4 $RPATH/$TITLE/

## uncomment when not using SubRip 
#mkdir $RPATH/$TITLE/;mv $RPATH/$TITLE.mp4 $RPATH/$TITLE/

#create htm and nfo file
#echo "Creating HTM and NFO Files"
sleep 2
#cd $RPATH/$TITLE/;mediainfo --Output=HTML * > $TITLE.htm;mediainfo -f * > $RPATH/$TITLE.txt;cat $TAG $RPATH/$TITLE .txt >> $TITLE.nfo;rm $RPATH/$TITLE .txt         

echo " All Done.. Watch your Film "
echo " Thanx 4 Using Quickrip "
exit 0



