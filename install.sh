#!/bin/bash

if ! command -v stow &> /dev/null; then
  echo "stow could not be found, please install it first."
  exit 1
fi

for dir in */; do
  dir=${dir%/}
  if [[ $dir != .* ]]; then
    echo "########### Installing $dir ###########"
    [ -f $HOME/.config/$dir/install.sh ] && source $HOME/.config/$dir/install.sh
    stow -R $dir -t $HOME
  fi 
done

