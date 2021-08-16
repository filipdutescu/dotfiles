#!/bin/bash

usage() {
  cat <<EOF
Usage:
    parse-udev-names [options ...] <encoded-name>

Parse names containing hex-encoded characters (such as '\x20') and output them.

Options:
    -h, --help          Display this message and exit
    -o, --output-file   File to write the decoded name to
    -v, --verbose       Display more information

Examples:
    parse-udev-names 'My\x20First\x20Device'

EOF
}

verbose_message() {
    if [[ $verbose -eq 1 ]]; then
        echo $1
    fi
}

decode_name() {
    echo -e "$1" | awk '{printf "%s\n", $_}'
}

main() {
    if [ $# -lt "1" ]; then
        usage
        exit 0
    fi

    for i in "$@"
    do
        case $i in
        -o | --output-file)
            out_file=1
        ;;
        -h | --help)
            usage
            exit 0
        ;;
        -v | --verbose)
            verbose=1
        ;;
        -*)
            cat <<EOF
parse-udev-names: invalid option -- '$i'
Try 'parse-udev-names --help' for more information.
EOF
            exit 1
        ;;
        *)
            if [[ $out_file -eq 1 ]]; then
                out_file=$i
            else
                name=$(decode_name $i)
            fi
        ;;
        esac
    done

    if [ -n "$out_file" ]; then
        verbose_message "Writing result to \"$out_file\"..."
        echo $name > $out_file
    else
        echo $name
    fi

    verbose_message "Done."
    exit 0
}

main $@
