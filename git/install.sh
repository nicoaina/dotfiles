#!/bin/sh

PACKAGE_NAME="git"

# Check if autojump is installed. If not, install it.
dpkg -l | grep -qw $PACKAGE_NAME || sudo apt-get update && sudo apt-get -y install $PACKAGE_NAME
