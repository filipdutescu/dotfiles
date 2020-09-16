#!/bin/bash

#export DISPLAY=":0" # Set the display to be used for the X session
user_home=/home/filip
scripts_base=$user_home/dotfiles/scripts

for session_data in $(loginctl list-sessions --no-legend | awk '{printf "%s %s\n", $2, $3}'); do
  # For each existing session, set the Xauthority and DBus session bus address
  session_id=$(echo $session_data | cut -d' ' -f1)
  session_user=$(echo $session_data | cut -d' ' -f2)

  #export XAUTHORITY="/home/$session_user/.Xauthority"
  export DBUS_SESSION_BUS_ADDRESS=unix:path="/run/user/$session_id/bus"

  parsed_name="$(/bin/sh $scripts_base/parse-udev-names.sh $2)"
  icon="/usr/share/icons/Papirus-Dark/32x32/devices/media-flash-memory-stick.svg"
  audio="/usr/share/sounds/freedesktop/stereo/device-added.oga"

  /bin/sh $scripts_base/notify.sh -i "$icon" -a "$audio" "$1" "$parsed_name"
done
