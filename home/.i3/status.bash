#!/usr/bin/env bash

status() {
    status=',['

    # date and time
    status+='{'
    status+='"name":"time",'
    status+='"color":"#ebdbb2",'
    status+='"full_text":'
    status+="\" $(date '+%Y-%m-%d | %H:%M:%S') \""
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
