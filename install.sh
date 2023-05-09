#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dir=~/dotfiles                    # dotfiles directory
# olddir=~/dotfiles_old             # old dotfiles backup directory
# files="bashrc gitconfig starship"    # list of files/folders to symlink in homedir

# ##########

# # create dotfiles_old in homedir
# echo "Creating $olddir for backup of any existing dotfiles in ~"
# mkdir -p $olddir
# echo "...done"

# # change to the dotfiles directory
# echo "Changing to the $dir directory"
# cd $dir
# echo "...done"

# mkdir -p ~/.oh-my-zsh/completions

# # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
# for file in $files; do
#     echo "Moving any existing dotfiles from ~ to $olddir"
#     mv ~/.$file ~/dotfiles_old/
#     echo "Creating symlink to $file in home directory."
#     ln -s $dir/$file ~/.$file
# done

# Use nix-2.13 to avoid breaking changes in home-manager
curl -L https://releases.nixos.org/nix/nix-2.13.0/install | sh -s -- --no-daemon

chmod 555 ~/.nix-profile/etc/profile.d/nix.sh
. ~/.nix-profile/etc/profile.d/nix.sh

nix build --experimental-features 'nix-command flakes' --no-link github:bderusha/dotfiles#bill

if [ -e ~/.profile ]; then mv ~/.profile ~/.profileBACKUP; fi
if [ -e ~/.bashrc ]; then mv ~/.bashrc ~/.bashrcBACKUP; fi

$(nix path-info --experimental-features 'nix-command flakes' github:bderusha/dotfiles#bill)/activate
