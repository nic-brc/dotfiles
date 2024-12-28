#!/usr/bin/env bash

if command -v wezterm &> /dev/null; then
  echo "wezterm is already installed"
  return 
fi

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask wezterm
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  apt update
  sudo apt install -y wezterm
fi
