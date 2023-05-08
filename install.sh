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

sh <(curl -L https://nixos.org/nix/install)
source ~/.nix-profile/etc/profile.d/nix.sh
nix build --no-link ~/src/dotfiles\#homeConfigurations.bill.activationPackage --extra-experimental-features nix-command --extra-experimental-features flakes
"$(nix path-info ~/src/dotfiles\#homeConfigurations.bill.activationPackage --extra-experimental-features nix-command --extra-experimental-features flakes)"/activate
