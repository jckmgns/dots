#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

xrdb ~/.Xresources

# Statusbar

while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m
done &

# Autostart

xset -dpms # disable power management
xset s off # disable screensaver
xset r rate 200 40 # keyboard repeat rate
xset m 0 0 # mouse pointer speed
xset b off # bell volume

setxkbmap -layout us -option -option compose:ralt

picom --config ~/.config/picom.conf -b
feh --bg-fill ~/.wallpaper.jpg

exec dwm
