#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do 
    :
done

polybar default &
