#!/bin/bash

set -o errexit

echoGreen() {
    echo "$(tput setaf 2; tput bold)$1$(tput sgr0)"
}

readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

create_files() {
    while [[ -n "$1" ]]; do
        local file="$( pwd )/$1/large.tmp.file"
        if [[ ! -e "${file}" ]]; then
          echoGreen "Creating a 50MB file: ${file}"
          mkdir -p "$( dirname ${file} )"
          dd if=/dev/urandom of="${file}" bs=1048576 count=50
        fi
        shift
    done
}

cd "$DIR/../foo/src/main"

create_files jib1 jib2 jib3 jib4 jib5 jib6 jib7 jib8 jib9 jib10

cd "$DIR/../bar/src/main"

create_files jib1 jib2 jib3 jib4 jib5 jib6 jib7 jib8 jib9
