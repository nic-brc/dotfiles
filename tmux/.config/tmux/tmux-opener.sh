#!/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(yq '.[] | keys[] | @sh' .opener.yml | fzf --print-query --preview='yq -r ".{n} | to_entries[].value" .opener.yml')
    url=$(yq -r ".[] | .$(echo ${selected}) | select(.)" .opener.yml)
fi

open $url
sleep 1
