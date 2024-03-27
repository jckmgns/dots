#!/usr/bin/env bash

color='#f5e0cc'

echo '{ "version": 1 }'
echo '['
echo '[]'

i3status | while :
do
    read line

    status=',['

    # title of active window

    # id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
    # name=$(xprop -id $id | awk -F= '/_NET_WM_NAME/{$1="";print $2}' | sed -e 's/^\s*"//' -e 's/"\s*$//')

    # status+='{'
    # status+='"name":"title",'
    # status+='"align":"left",'
    # status+="\"color\":\"$color\","
    # status+='"full_text":'
    # status+="\"$name |\""
    # status+='},'

    # date and time
    status+='{'
    status+='"name":"time",'
    status+="\"color\":\"$color\","
    status+='"full_text":'
    status+="\"$(date '+%Y-%m-%d | %H:%M') \""
    status+='}'

    status+=']'

    echo ${status}

    sleep 20
done

echo ']'
