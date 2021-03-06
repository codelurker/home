#!/bin/bash
# ~/.bash_aliases
# http://m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD
##################

#######################
##   Start Aliases   ##
#######################
## Now Edit or Add Aliases to File
##################
# Systeminfo
##################
alias sinfo="sh ~/scripts/sysinfo.sh"
alias ssinfo="sh ~/scripts/ssinfo.sh"

# User Defined Aliases
##################
alias resetbash="reset;source ~/.bashrc"
alias ls="ls --color=auto"
alias ll="ls --color=auto -l"
alias lsa="ls --color=auto -A"
alias lsg="ls --color=auto | grep"
alias lll="ls --color=auto -al"
alias cls="clear"
alias clls="clear; ls"
alias na="nano"
alias web="cd $HOME/dls/ && elinks https://ssl.scroogle.org" 
alias ~="cd ~"
alias md="mkdir"
alias psax="ps ax --forest"
alias psuax="ps aux --forest"
alias home="cd ~"
alias un="tar -zxvf"
alias mountedinfo="df -hT"
alias ping="ping -c 10 "
alias ns="netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2"
alias da="date "+%Y-%m-%d %A    %T %Z""
alias ebrc='vim ~/.bashrc && source ~/.bashrc'
alias c="cal"
alias up="uptime"
alias exi="clear;exit"
alias x="xinit"
alias shutdown="sudo shutdown -h now"
alias miPod="pmount -w /dev/sdg2 iPod"
alias uiPod="pumount iPod"
alias catinfo="cat *.info"
alias mvnzb="~/scripts/misc/mvnzb.sh"
alias mplayeralsa="mplayer -ao alsa "
alias comterm="urxvt -name 'com' &"
alias editterm="urxvt -name 'edit' &"
alias devterm="urxvt -name 'dev' &"
alias trannyterm="transset .90 "
alias less="$PAGER"
alias vim2html="~/scripts/office/vim2html.sh "
alias openpdf="apvlv "
alias sitedump="~/scripts/net/site-grab.sh "
#alias teamspeak="wine $HOME/.wine/drive_c/Program\ Files/Teamspeak2_RC2/TeamSpeak.exe"
alias munrar="$HOME/scripts/archive/unrar.sh"
alias mountiso="mount -t iso9660 -o loop=/dev/loop0"
alias tunetv="sh $HOME/scripts/tv/tune-ivtv.sh"
alias newplaylists="cd $HOME/Music/;sh ~/scripts/rip/audio/genm3u_audioplaylist.sh;~/scripts/rip/audio/newplaylist.sh"
#UZBL
alias uzblweb="$HOME/.config/uzbl/scripts/uzbl-tabbed & "
#vimprobable2
alias vimprob2="sh ~/scripts/net/strttabbedvimprobable2.sh"

# Pacman
# sudo pacman -Syu by typing pacup (sudo must be installed and configured first)
alias pacup="sudo pacman -Syu"
# sudo pacman -S by typing pac
alias pac="sudo pacman -S"
# sudo pacman -R by typing pac
alias pacR="sudo pacman -R"
# sudo pacman -U by typing pac
alias pacU="sudo pacman -U"
# Display information about a given package in the repositories
alias powSi='pacman -Si'
# Display information about a given package in the local database
alias pacQi='pacman -Qi'
# Search for package(s) in the local database
alias pacQs='pacman -Qs'
# colorized pacman output with pacs alias:
alias pacs="pacsearch"
pacsearch() {
   echo -e "$(pacman -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

# Yaourt aliases
alias yaoS="yaourt -S"
alias yaoSy="yaourt -Sy"
alias yaoR="yaourt -R"
# colorized pacman output with pacs alias:
alias pacs="yaosearch"
yaosearch() {
   echo -e "$(yaourt -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

# Powerpill
# sudo powerpill -Syu by typing pacup (sudo must be installed and configured first)
alias powSu="sudo powerpill -Syu"
# sudo powerpill -S by typing pac
alias powS="sudo powerpill -S"
# sudo powerpill -R by typing pac
alias powR="sudo powerpill -R"
# sudo powerpill -U by typing pac
alias powU="sudo powerpill -U"
# Display information about a given package in the repositories
alias powSi='powerpill -Si'
# Display information about a given package in the local database
alias powQi='powerpill -Qi'
# Search for package(s) in the local database
alias powQs='powerpill -Qs'
powsearch() {
    echo -e "$(powerpill -Ss "$@" | sed \
    -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
    -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
    -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
    -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
    \033[0m"
}


# Git Aliases
alias gitb="git branch -a -v"
alias gitba="git branch -a"
alias gitbl="git branch -l"
alias gitbr="git branch -r"
alias gits="git status"
alias gitd="git diff"
alias gitca="git commit -a"
alias gitpo="git push origin "
alias gitpom="git push origin master"
alias gitco="git checkout "
alias gitcm="git checkout master"
alias gitclo="git clone "
alias gitp="git pull "
alias gitx="gitx"
alias gitmm="git merge master"
alias gitcb="git-create-branch"

# gc      => git checkout master
# gc bugs => git checkout bugs
function gitco {
  if [ -z "$1" ]; then
      git checkout master
  else
      git checkout $1
  fi
}

ghclone ()
{   
    gh_url=${1:-`pbpaste`};
    co_dir=${HOME}/Code/sources/$(echo $gh_url | sed -e 's/^git:\/\/github.com\///; s/\//-/; s/\.git$//');
    if [ -d $co_dir ]; then
        cd $co_dir && git pull origin master;
    else
        git clone "${gh_url}" "${co_dir}" && cd "${co_dir}";
    fi
}

# Screen Aliases
#############
alias scrn1="screen -c ~/.screenrc_1"
alias scrn2="screen -c ~/.screenrc_2"
alias bashtc="~/apps/bin/bashtc"

# Slackware Tools
#############
#alias pkgtool="sudo /sbin/pkgtool "
#alias slaptget="sudo /usr/sbin/slapt-get "
#alias makepkg="sudo /sbin/makepkg "
#alias installpkg="sudo /sbin/installpkg "
#alias removepkg="sudo /sbin/removepkg "
#alias explodepkg="sudo /sbin/explodepkg "
#alias upgradepkg="sudo /sbin/upgradepkg "
#alias slackbuild
#alias buildinstall="chmod a+x *.SlackBuild ;sudo ./*.SlackBuild;installpkg /tmp/*.tgz;sudo rm /tmp/*.tgz"

# Various Fun Test
#############
alias bz2="sh ~/scripts/bz2.sh"
alias figlet="figlet -d ~/.figfonts/ "
alias forcowsay="${R}fortune | ${B}cowsay"
#alias quadconky="sh ~/scripts/quad_conky.sh"
#alias rightconky="sh ~/scripts/right-conky.sh"
#alias leftconky="sh ~/scripts/left-conky.sh"
alias conky-1="sh ~/scripts/conky-scripts/conky-new.sh"
alias nzbgrab="hellanzb.py enqueuenewzbin "

#Alias to Chmod
#############
alias 755="find . -type d -exec chmod 755 {} \;"
alias 644="find . -type f -exec chmod 644 {} \;"
alias 664="find . -type f -exec chmod 664 {} \;"
alias 775="find . -type f -exec chmod 775 {} \;"

# Alias"s to control hardware
#############
alias dvd0o="eject /dev/dvd0"
alias dvd0c="eject -t /dev/dvd0"
alias dvd1o="eject /dev/dvd1"
alias dvd1c="eject -t /dev/dvd1"
alias scan="scanimage -L"

# DVD Backup - Rip
#############
alias dvdbkupinfo="dvdbackup -I -i /dev/dvd"
alias dvdbkupmain="dvdbackup -F -i /dev/dvd -o ~/Video/rip/dvd/"
alias dvdbkupall="dvdbackup -M -i /dev/dvd -o ~/Video/rip/dvd/"
alias dvdbkuptitleset="dvdbackup -i /dev/dvd -o ~/Video/rip/dvd/ -T "
alias dvdbkuptitle="dvdbackup -i /dev/dvd -o ~/Video/rip/dvd/ -t "
alias dvdbkupchapterfrom="dvdbackup -i /dev/dvd -o ~/Video/rip/dvd/ -S "
alias dvdbkupchapterto="dvdbackup -i /dev/dvd -o ~/Video/rip/dvd/ -e "

#Create DVD
#############
alias videots-to-iso="~/scripts/misc/video-to-iso.sh "

# Alias to some Applications
##################
alias kdx="~/apps/kdx/KDXClient.lexe & "
alias imageshackup="~/scripts/imageshackup.sh"
alias tronad="/usr/local//bin/armagetronad"
#alias idesktool="~/.idesktop/idesktool"
#alias mediainfohtm="mediainfo --Output=HTML " 
alias vlcremote="vlc --control lirc "
alias vlctv="vlc --hdtv-fix --aspect-ratio=16:9 --deinterlace-mode=b --disable-screensaver --control lirc /dev/video0"
alias mplayertv="mplayer -ao alsa -vf pp=lb /dev/video0 "
#alias mplayerscrnshot="mplayer -vf -ao null "
alias weechat="weechat-curses"
alias fbcmd="/usr/local/fbcmd/fbcmd.php"

# Office
##################
alias massotf2ttf="~/scripts/mass-otf2ttf.sh"

# Alias to Scripts
##################
# Audio
alias aac2mp3="sh ~/scripts/rip/audio/aac2mp3.sh "
alias cleanmp3="sh ~/scripts/rip/audio/cleanmp3.sh "
alias m4a2mp3="sh ~/scripts/rip/audio/m4a2mp3.sh "
alias m4a2wav="sh ~/scripts/rip/audio/m4a2wav.sh "
alias m4a2ogg="sh ~/scripts/rip/audio/m4a2ogg.sh "
alias mp32wav="sh ~/scripts/rip/audio/mp32wav.sh "
alias mp32ogg="sh ~/scripts/rip/audio/mp32ogg.sh "
alias ogg2mp3="sh ~/scripts/rip/audio/ogg2mp3.pl "
alias tagm4a2mp3="sh ~/scripts/rip/audio/tagm4a2mp3.sh "
alias wav2mp3="sh ~/scripts/rip/audio/wav2mp3.sh "
alias wav2ogg="sh ~/scripts/rip/audio/wav2ogg.sh "
alias wma2mp3="sh ~/scripts/rip/audio/wma2mp3.sh"
alias wma2wav="sh ~/scripts/rip/audio/wma2wav.sh "
alias rmm4a="sh ~/scripts/rip/audio/rmm4a.sh "
alias rmwav="sh ~/scripts/rip/audio/rmwav.sh "
alias rmogg="sh ~/scripts/rip/audio/rmogg.sh "
alias cd_rip="sh ~/scripts/rip/audio/cd_rip.sh "
alias genm3u="sh ~/scripts/rip/audio/genm3u.sh "
alias mvm3uplayfolder="sh ~/scripts/rip/audio/mvm3uplayfolder.sh "
# Video
alias DvDre="sh ~/apps/dvdre/scripts/dvdre.sh"

# Screenshot
##################
alias snapscreen="sh ~/scripts/image/scrotsnap.sh "
alias snapdelay="sh ~/scripts/image/scrotdelay.sh "
alias dragscrot="sh ~/scripts/image/dragscrot.sh "
alias infosshot="perl ~/scripts/image/info.pl"

# Bash Aliases
##################
if [ -f ~/.bash_aliases_ssh-ftp ]; then
 . ~/.bash_aliases_ssh-ftp
fi

# Fifo Nicklist Irssi
##################
#alias irsii="aterm -name aterm -title irssi -g 112x65+215+32 &"
#alias userlist="aterm -name aterm -title Ulist -g 17x30+1255+255 &"
#alias nicklist="cat ~/.irssi/nicklistfifo"

# Wallpapers
##################
alias wallpaperzim="feh --bg-center ~/images/wallpapers/invader-zim2.png"
alias wallpaperhobbes="feh --bg-center ~/images/wallpapers/Calvin-Hobbes.jpg"
alias wallpapercanti="feh --bg-center ~/images/wallpapers/Canti.png"
alias wallpaperflcl=-"feh --bg-center ~/images/wallpaper/1440-900-FLCL-bw-2.png"

# Apps with Wine
##################
#alias gchrome="wine /opt/windows/Google/chrome/chrome.exe"

# easy extraction
 extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

#####################
##   End Aliases   ##
#####################
