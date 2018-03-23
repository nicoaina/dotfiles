#!/bin/sh

PACKAGE_NAME="vim"

# Check if autojump is installed. If not, install it.
dpkg -l | grep -qw $PACKAGE_NAME || sudo apt-get update && sudo apt-get -y install $PACKAGE_NAME

# Install Vundle to manage vim plugin
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugin
vim +PluginInstall +qall

