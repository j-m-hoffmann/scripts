#!/usr/bin/env bash
set -euo pipefail

cp -r . ~/.scripts

echo PATH="$PATH:$HOME/.scripts" >> $HOME/.profile

cp ~/.scripts/dotfiles/.bash_aliases $HOME/.bash_aliases

sudo apt install vim
cp ~/.scripts/dotfiles/.vimrc $HOME
echo 'export EDITOR=vim' >> ~/.profile
# echo 'export EDITOR=/home/user/.local/bin/nvim' >> ~/.profile
# cp ~/.scripts/dotfiles ~/.config/nvim/init.vim

exit 0
