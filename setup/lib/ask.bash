#!/usr/bin/env bash

# ============================================================ 
# NAME
#   ask - prints generic output for easy user options
#
# SYNOPSIS
#   ask QUESTION [DEFAULT_ANSWER]
#
# DESCRIPTION
#   ask is a general-purpose function to ask yes/no questions
#   in bash, either with or without a default answer.
#   It keeps repeating until the given question has reveived 
#   valid input.
#
# EXAMPLE
#   if ask "message" "y"; then
#       echo "yes"
#   else
#       echo "no"
#   fi
# ============================================================  

ask() {
    local prompt 
    local message=${1}
    local default=${2}

    case $default in 
        [yY]*)
            message="${message} [Y/n]"
            default=y
            ;;
        [nN]*)
            message="${message} [y/N]"
            default=n
            ;;
        *)
            message="${message} [y/n]"
            default=
            ;;
    esac

    while true; do
        echo -n "$message "
        read reply 

        if [[ ! -z $default ]] && [[ -z $reply ]]; then
            reply=$default
        fi

        case $reply in
            [yY]*)
                return 0
                ;;
            [nN]*)
                return 1
                ;;
        esac

        reply=""
        echo "Please supply a valid answer!"
        echo
    done
}
