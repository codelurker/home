#!/bin/sh
# ~/.xsession | ~/.xinitrc
# M. reDD MreDD@0tue0.com
# http://pyrrhous.com
#
###############################
#Font Help
xset +fp ${HOME}/.fonts
# SSH
#SSH_ASKPASS=ssh-askpass ssh-add

# Misc
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

# Aliases
x='xinit'

# Start Window Manager
case "$1" in
    fluxbox)
           xcompmgr &
           xset -b b off &
           xrdb -load .Xdefaults &
           xbindkeys &
           irexec &
           ipager &
           xscreensaver -no-splash &
           numlockx &
           idesk &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           exec ck-launch-session startfluxbox ;;
    pekwm)  
           urxvtd -q -f -o &
           exec ck-launch-session pekwm ;;
    wmii)
           xrdb -load .Xdefaults &
           xset m 4 1 &
           xcompmgr & 
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           xset +fp /usr/share/fonts/local
           xset fp rehash
           xmodmap ~/.xmodmap-`uname -n`
           ~/.wmii-hg/scripts/chstartmcore.sh
           #feh --bg-center ~/images/wallpapers/omfg-paper.png
           #stalonetray &
           sleep 1
           #wistrut $(wmiir read /tag/sel/index | awk '/panel:stalonetray:panel/{print $2}') &
           until exec ck-launch-session wmii; do true ; done  ;;
    *)
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
           $HOME/scripts/image/rotate-wallpaper.sh &
           #conky -c ~/.conkyrcore > ~/.conkywmii&
           #conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           urxvt -name 'shell' &    
           exec ck-launch-session scrotwm   ;;
esac
