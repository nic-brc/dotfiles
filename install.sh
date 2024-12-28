#!/bin/bash

for dir in */; do
  dir=${dir%/}
  if [[ $dir != .* ]]; then
    echo "########### Installing $dir ###########"
    [ -f $HOME/.config/$dir/install.sh ] && source $HOME/.config/$dir/install.sh
    stow -R $dir -t $HOME
  fi 
done

