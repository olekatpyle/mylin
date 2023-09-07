#!/usr/bin/env bash

hour=$(date +'%H')
night_time=(20 21 22 23 00 01 02 03 04 05)

if [[ " ${night_time[*]} " =~ " ${hour} " ]]; then
    hyprctl hyprpaper wallpaper eDP-1,~/assets/pymeon/wp_dark.jpeg
    #hyprctl hyprpaper wallpaper HDMI-A-1,~/assets/pymeon/wp_dark.jpeg > /dev/null
else 
    hyprctl hyprpaper wallpaper eDP-1,~/assets/pymeon/wp.jpeg
    #hyprctl hyprpaper wallpaper HDMI-A-1,~/assets/pymeon/wp.jpeg > /dev/null
fi

