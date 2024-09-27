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

function install_starship {
  which starship &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
  else
    echo "Already installed: ${1}"
  fi
}

function install_difftastic {
  which difft &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    curl -sL https://github.com/Wilfred/difftastic/releases/latest/download/difft-x86_64-unknown-linux-gnu.tar.gz -o difft.tar.gz
    sudo tar -xzf difft.tar.gz -C /usr/local/bin
    rm -rf difft.tar.gz
  else
    echo "Already installed: ${1}"
  fi
}

install bat
install curl
install figlet
install git
install gpg2
install jq
install keychain
install neofetch
install vim

install_starship
install_difftastic

# Clean up and upgrade
sudo apt autoremove -y
sudo apt upgrade -y