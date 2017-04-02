#!/bin/sh
#
# Install vim dependencies : vundle
[ -d ~/.vim ] || mkdir ~/.vim
[ -d ~/.vim/bundle ] || mkdir ~/.vim/bundle
[ -d ~/.vim/bundle/vundle ] || git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#vim +PluginInstall +qall now
