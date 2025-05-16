#!/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(yq '.[] | keys[] | @sh' .opener.yml | fzf --preview='yq -r ".{n} | to_entries[].value" .opener.yml')
    url=$(yq -r ".[] | .$(echo ${selected}) | select(.)" .opener.yml)
fi

if [[ -z $selected ]]; then
    exit 0
fi

open $url
