#!/bin/bash

backupdir="$HOME/.config/dotfiles/dotfiles_BACKUP"

function link_file {
    source_file=$1
    destination_dir=$2
    destination_file=$3
    # if existing symling, remove it
    if [ -L $destination_dir/$destination_file ]; then
        echo "Removing existing symlink $destination_dir/$destination_file"
        rm $destination_dir/$destination_file
    fi
    if [ -f $destination_dir/$destination_file ]; then
        echo "Moving any existing dotfiles from ~ to $backupdir"
        mkdir -p $backupdir
        mv $destination_dir/$destination_file $backupdir/
    fi
    echo "Creating symlink $destination_dir/$destination_file -> $PWD/config/$source_file"
    mkdir -p $destination_dir
    # symlink to file name in this directory
    ln -s $PWD/config/$source_file $destination_dir/$destination_file
}

link_file .bashrc $HOME .bashrc
link_file .gitconfig $HOME/.config/git config
link_file neofetch.conf $HOME/.config/neofetch neofetch.conf
link_file starship.toml $HOME/.config/starship starship.toml