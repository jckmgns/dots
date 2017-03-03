#!/bin/bash

# update package list
sudo apt-get update

# basic
sudo apt-get -f -y install software-properties-common

# i3
sudo apt-get -f -y install i3 suckless-tools i3blocks rofi feh compton unclutter rxvt-unicode-256color

# ncmpcpp
sudo apt-get -f -y install mpd ncmpcpp mpc 
sudo systemctl stop mpd.service
sudo systemctl disable mpd.service

# appearance
sudo apt-get -f -y install arc-theme
sudo apt-get -f -y install adwaita-icon-theme

# applications
sudo apt-get -f -y install nm-applet vim chromium-browser thunderbird git lxappearance thunar ranger htop steam krita kdiff3

echo "don't forget to pull dotfiles from git-server!"
