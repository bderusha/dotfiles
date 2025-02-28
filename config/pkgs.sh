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

function install_sh {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    curl -LsSf $2 | sh
  else
    echo "Already installed: ${1}"
  fi
}

function install_starship {
  which starship &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
  else
    echo "Already installed: starship"
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

function install_docker {
  which docker &> /dev/null

  if [ $? -ne 0 ]; then
    # Ensure pre-requisites are installed
    sudo apt-get install \
       ca-certificates \
       curl \
       gnupg \
       lsb-release

   # Adds docker apt key
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

   # Adds docker apt repository
    echo \
       "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

   # Refreshes apt repos
    sudo apt-get update

   # Installs Docker CE
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  else
    echo "Already installed: starship"
  fi

  getent group docker &> /dev/null
  if [ $? -ne 0 ]; then
    sudo groupadd docker
  else
    sudo usermod -aG docker $USER
  fi
}

# install bat
install curl
install figlet
install git
install gnupg2
# install jq
install keychain
install neofetch
# install vim

# install_starship
# install_difftastic
install_docker

install_sh mise https://mise.run
# install_sh uv https://astral.sh/uv/install.sh


# Clean up and upgrade
sudo apt autoremove -y
sudo apt upgrade -y