#!/bin/bash

usage() {
  cat <<EOF
Usage:
  notify [options ...] <title> <description>

Send a notification using a supported utility, such as 'libnotify' (default).

Options:
  -h, --help                Display this message and exit
  -i, --icon <file>         Icon to show in the notification (<file> can be a path, name etc.)
  -a, --audio <file>        Audio clip to play with the notification (<file> can be a path, name etc.)

Examples:
  notify 'Hello' 'World!'
EOF
}

error() {
  cat <<EOF
[ERROR] notify: $1
Try 'notify --help' for more information.
EOF
  exit 1
}

assign_parameter_value() {
  if [ "$icon" == "-1" ]; then
    icon=$1
  elif [ "$audio" == "-1" ]; then
    audio=$1
  elif ! [ -n "$title" ]; then
    title="$1"
  else
    if [ -n "$description" ]; then
      description="$description"
    fi
    description="$1"
  fi
}

validate_parameters() {
  if ! [ -n "$title" ]; then
    error "Missing <title> from the received parameters."
  fi

  if [ "$icon" == "-1" ]; then
    error "Missing <file> required by the '-i/--icon' flag."
  fi

  if [ "$audio" == "-1" ]; then
    error "Missing <file> required by the '-a/--audio' flag."
  fi
}

send_notification() {
  if ! [ -x "$(command -v notify-send)" ]; then
    echo "[FATAL] notify: Failed to find 'libnotify'."
    exit 1
  fi

  action="/usr/bin/notify-send \"$1\" \"$2\""
  if [ -n "$icon" ]; then
    action="$action -i $icon"
  fi

  if [ -n "$audio" ]; then
    if [ -x "$(command -v paplay)" ]; then
      play_audio="paplay $audio"
    elif [ -x "$(command -v aplay)" ]; then
      play_audio="aplay $audio"
    fi

    if ! [ -n "$play_audio" ]; then
      echo "[WARN] notify: Could not detect either ALSA or PluseAudio for playing sounds."
      exit 1
    fi

  action="$action && $play_audio"
  fi

  for logged_user in $(who | cut -d' ' -f1 | uniq); do
    su $logged_user -c "$action"
  done
}

main() {
  if [ $# -lt "1" ]; then
    usage
    exit 0
  fi

  backend="libnotify"
  title=""
  description=""

  for i in "$@"
  do
    case $i in
      -h | --help)
        usage
        exit 0
      ;;
      -i | --icon)
        icon=-1
      ;;
      -a | --audio)
        audio=-1
      ;;
      -*)
        cat <<EOF
[ERROR] notify: invalid option -- '$i'
Try 'notify --help' for more information.
EOF
        exit 1
      ;;
      *)
        assign_parameter_value "$i"
      ;;
    esac
  done

  validate_parameters
  send_notification "$title" "$description"

  exit 0
}

main "$@"
