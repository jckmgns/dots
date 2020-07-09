#!/usr/bin/env bash

status() {
    status=',['

    # volume
    status+='{'
    status+='"name": "volume",'
    status+='"color": "#ebdbb2",'
    status+='"separator_block_width": 0,'
    status+='"full_text":'
    status+="\"| VOL: $(amixer get Master | awk -F"[][]" '/Left:/ { print $2 }') | \""
    status+='}'

    status+=","

    # date and time
    status+='{'
    status+='"name":"time",'
    status+='"color":"#ebdbb2",'
    status+='"full_text":'
    status+="\"$(date '+%Y-%m-%d | %H:%M:%S') |\""
    status+='}'

    status+=']'

    echo ${status}
}

# ==============================

echo '{ "version": 1 }'
echo '['
echo '[]'

while :; do
    status
    sleep 1
done

echo ']'
