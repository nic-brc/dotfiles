echo "Installing fzf"
rm -rf $HOME/.local/share/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.local/share/fzf
$HOME/.local/share/fzf/install --all --no-update-rc

echo "Installing forgit"
rm -rf $HOME/.local/share/forgit
git clone --depth 1 https://github.com/wfxr/forgit.git $HOME/.local/share/forgit

