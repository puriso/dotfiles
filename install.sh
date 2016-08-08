#!/bin/sh
<<<<<<< HEAD

echo "start installing..."

# Install NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Make symbolic link for dotfiles
ln -sf ~/.vimrc ~/git/dot/.vimrc
ln -sf ~/.jshintrc ~/dot/.jshintrc

# Install ctags
=======
ln -sf ~/git/dot/.vimrc ~/.vimrc
ln -sf ~/git/dot/.jshintrc ~/.jshintrc
ln -sf ~/git/dot/.zshrc ~/.zshrc
>>>>>>> 776762f1ee02adcb4e54593ad51512c26aedc7d8


echo "...end!"
