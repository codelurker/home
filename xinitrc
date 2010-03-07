#!/bin/sh
# ~/.xsession | ~/.xinitrc
# M. reDD MreDD (at) 0tue0.com
# http://m-redd.com
#
###############################
#Font Help
xset +fp ${HOME}/.fonts
# SSH
eval `/usr/bin/ssh-agent`
SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null

# Misc
if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

[ -f /etc/X11/Xmodmap ] && xmodmap /etc/X11/Xmodmap

# Aliases
x='xinit'

# Start Window Manager
case "$1" in
    awesome)
           exec ck-launch-session awesome ;;
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
#           conky -c ~/.conkyrcore > ~/.conkywmii&
#           conky -c ~/.conkyrc > ~/.conkydzen&
           # Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           exec ck-launch-session startfluxbox ;;
    pekwm)  
           exec ck-launch-session pekwm ;;
    wmii)
           autocutsel -fork &
           autocutsel -selection PRIMARY -fork &
           xrdb -load .Xdefaults &
           xset m 4 1 &
           xcompmgr & 
           xbindkeys &
           irexec &
#           xscreensaver -no-splash &
           numlockx &
           xset +fp /usr/share/fonts/local 
           xset fp rehash 
           xmodmap ~/.xmodmap-`uname -n` 
           ~/.wmii-hg/scripts/chstartmcore.sh 
#           feh --bg-center ~/images/wallpapers/omfg-paper.png
#           stalonetray &
           sleep 1
#           wistrut $(wmiir read /tag/sel/index | awk '/panel:stalonetray:panel/{print $2}') &
           until exec ck-launch-session wmii; do true ; done  ;;
    *)
           xbindkeys &
           irexec &
           xscreensaver -no-splash &
           numlockx &
#           $HOME/scripts/image/rotate-wallpaper.sh &
#           conky -c ~/.conkyrcore > ~/.conkywmii&
#           conky -c ~/.conkyrc > ~/.conkydzen&
#           Startup Sounds
           $HOME/scripts/system/startxsound.sh &
           urxvt -name 'shell' &    
           exec ck-launch-session scrotwm   ;;
esac
