#!/bin/bash

#export DISPLAY=":0" # Set the display to be used for the X session
user_home=/home/filip
scripts_base=$user_home/dotfiles/scripts

parsed_name="$(/bin/sh $scripts_base/parse-udev-names.sh $2)"
icon="/usr/share/icons/Papirus-Dark/32x32/devices/media-flash-memory-stick.svg"
audio="/usr/share/sounds/freedesktop/stereo/device-$3.oga"

/bin/sh $scripts_base/notify.sh -i "$icon" -a "$audio" "$1" "$parsed_name"
