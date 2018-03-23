#!/bin/sh

PACKAGE_NAME="zsh"

# Check if zsh is installed. If not, install it.
dpkg -l | grep -qw $PACKAGE_NAME || sudo apt-get update && sudo apt-get -y install $PACKAGE_NAME

# set zsh as default shell
echo "We need your password to change shell to zsh..."
chsh -s $(which zsh) | read 
