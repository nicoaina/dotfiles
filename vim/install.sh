#!/bin/sh
#
# Install vim dependencies : vundle
[ -d ~/.vim ] || mkdir ~/.vim
[ -d ~/.vim/bundle ] || mkdir ~/.vim/bundle
[ -d ~/.vim/bundle/vundle ] || git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Redirecting output to /dev/null to avoid meaningless alert message
# https://github.com/VundleVim/Vundle.vim/issues/511
vim +PluginInstall +qall now &>/dev/null

