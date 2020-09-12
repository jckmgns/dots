#!/usr/bin/env bash

echo -n $PATH | sed "s/:/\n/g" | xargs -P 8 -I{} find {} -maxdepth 1 -executable | awk -F"/" "{print \$NF}" | sort | uniq -i | fzf --color=bw --reverse --height 100%
