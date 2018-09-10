# KAWAII* dotfiles

とても可愛いdotfileたちなのなのです👩‍❤️‍💋‍👩

## install

```
# Install NeoBundle
mkdir -p ~/.vim/bundle
mkdir ~/.vim/backup
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Clone my dotfiles from github
git clone git://github.com/puriso/dotfiles ~/git/dot/

# dotfiles
ln -sf ~/git/dot/.vimrc ~/.vimrc
ln -sf ~/git/dot/.jshintrc ~/.jshintrc
ln -sf ~/git/dot/.zshrc ~/.zshrc
ln -sf ~/git/dot/.tmux.conf ~/.tmux.conf
mv ~/.gvimrc ~/.gvimrc_original
ln -sf ~/git/dot/.vimrc ~/.gvimrc
rm /Applications/MacVim.app/Contents/Resources/vim/vimrc
rm /Applications/MacVim.app/Contents/Resources/vim/gvimrc

# Install tmux's plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# Install for vimrc
# php
npm install -g phplint
# JSHint
npm install -g jshint
# ctag
brew install ctags
```

## todo

構築の自動化をスマートに



