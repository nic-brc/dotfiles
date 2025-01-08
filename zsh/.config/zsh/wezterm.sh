if command -v wezterm &> /dev/null; then
  source <(wezterm shell-completion --shell zsh)
  return 
fi

