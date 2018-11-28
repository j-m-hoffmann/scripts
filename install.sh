#!/usr/bin/env bash
set -euo pipefail

mv . ~/.scripts
echo PATH="$PATH:$HOME/.scripts" >> ~/.profile

cp ~/.scripts/dotfiles/.bash_aliases ~/.bash_aliases
echo '. ~/.bash_aliases' >> ~/.bashrc
. ~/.bash_aliases

pin vim
# echo 'export EDITOR=vim' >> ~/.profile
# echo 'export EDITOR=/home/user/.local/bin/nvim' >> ~/.profile
# cp ~/.config/nvim/init.vim ~/.scripts/dotfiles

exit 0
