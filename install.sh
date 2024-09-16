#!/bin/bash

./config/symlink.sh
./config/pkgs.sh

# Get all upgrades
sudo apt upgrade -y

# See our bash changes
source ~/.bashrc

# Fun hello
figlet "... and we're back!"