#!/bin/bash

set -eu

# REBOOT first to ensure you have the last installed kernel running

# clean Journal
sudo journalctl --vacuum-size=50M

# clean old unused kernels
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'

# clean apt packages
sudo apt autoremove  
sudo apt clean

# first ensure to have the configured snap retain to 2
sudo snap set system refresh.retain=2

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
   sudo snap remove "$snapname" --revision="$revision"
done

