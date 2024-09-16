#!/bin/bash

##########################
# Install Packages
##########################
sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install difft
install figlet
install git
install gpg2
install jq
install keychain
install neofetch
install starship
install vim

