#!/bin/bash

backupdir="$HOME/dotfiles_BACKUP"

function link_file {
    file=$1
    destination=$2
    # if existing symling, remove it
    if [ -L $destination/$file ]; then
        echo "Removing existing symlink $destination/$file"
        rm $destination/$file
    fi
    if [ -f $destination/$file ]; then
        echo "Moving any existing dotfiles from ~ to $backupdir"
        mkdir -p $backupdir
        mv $destination/$file $backupdir/
    fi
    echo "Creating symlink $destination/$file -> $PWD/config/$file"
    mkdir -p $destination
    # symlink to file name in this directory
    ln -s $PWD/config/$file $destination/$file
}

link_file .bashrc $HOME
link_file .gitconfig $HOME/.config/git
link_file neofetch.conf $HOME/.config/neofetch
link_file starship.toml $HOME/.config/starship