#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################


# Use nix-2.13 to avoid breaking changes in home-manager
curl -L https://releases.nixos.org/nix/nix-2.13.0/install | sh -s -- --no-daemon

chmod 555 ~/.nix-profile/etc/profile.d/nix.sh
. ~/.nix-profile/etc/profile.d/nix.sh

nix build --experimental-features 'nix-command flakes' --no-link github:bderusha/dotfiles

if [ -f ~/.profile ] && [ ! -L ~/.profile ]; then mv ~/.profile ~/.profileBACKUP -b; fi
if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then mv ~/.bashrc ~/.bashrcBACKUP -b; fi 

$(nix path-info --experimental-features 'nix-command flakes' github:bderusha/dotfiles)/activate
