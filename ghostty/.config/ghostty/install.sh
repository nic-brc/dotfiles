if command -v ghostty &> /dev/null; then
  echo "ghostty is already installed"
  return 
fi

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask ghostty
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  wget https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.0.1-0-ppa1/ghostty_1.0.1-0.ppa1_amd64_24.04.deb -O $HOME/Downloads/ghostty.dep
  sudo dpkg -i $HOME/Downloads/ghostty.dep
fi
