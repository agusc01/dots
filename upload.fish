#!/usr/bin/env fish

set DESTINATION Dots

set BASE $HOME/$DESTINATION

mkdir -vp $BASE/.config
cp -rv $BASE/.config/{nvim,fish,lazygit,tmux} $HOME/.config/
cp -rv $BASE/.gitignore $HOME/
cp -rv $BASE/.gitconfig $HOME/
cp -rv $BASE/.bash_aliases $HOME/

echo -e "\nUploaded complete\n"
