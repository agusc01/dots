#!/usr/bin/env fish

set DESTINATION Dots

set BASE $HOME/$DESTINATION

rm -rf $BASE/.config/
rm -rf $BASE/.gitignore
rm -rf $BASE/.gitconfig
rm -rf $BASE/.bash_aliases

mkdir -vp $BASE/.config
cp -rv $HOME/.config/{nvim,fish,lazygit,tmux} $BASE/.config/
cp -rv $HOME/.gitignore $BASE/
cp -rv $HOME/.gitconfig $BASE/
cp -rv $HOME/.bash_aliases $BASE/

echo -e "\nBackup complete\n"
