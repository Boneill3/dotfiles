#!/bin/bash
############################
# make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Copied from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc gitconfig p10k.zsh"    # list of files/folders to symlink in homedir

case "$OSTYPE" in
  darwin*)
    dir=$dir/darwin
    ;;
  linux*)
    dir=$dir/linux
    ;;
  *)
    echo "OS NOT DETECTED"
    exit 0
    ;;
esac

"$dir/install.sh"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install vundle plugins
vim +PluginInstall +qall

