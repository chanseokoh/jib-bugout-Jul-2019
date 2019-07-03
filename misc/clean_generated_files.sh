#!/bin/sh

set -o errexit

echoGreen() {
    echo "$(tput setaf 2; tput bold)$1$(tput sgr0)"
}

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rm -f "$DIR"/../*/src/main/jib*/large.tmp.file
rmdir "$DIR"/../*/src/main/jib*
