#!/bin/sh

echo "start installing..."

# Install NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Make symbolic link for dotfiles
ln -sf ~/.vimrc ~/git/dot/.vimrc
ln -sf ~/.jshintrc ~/dot/.jshintrc

# Install ctags


echo "...end!"
