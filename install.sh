#!/bin/bash

./config/symlink.sh
./config/pkgs.sh

# See our bash changes
source ~/.bashrc

# Fun hello
figlet "... and we're back!"