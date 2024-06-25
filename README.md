# dotfiles

dotfiles👩‍❤️‍💋‍👩

## Install

###  MacVimをインストール
[https://github.com/macvim-dev/macvim/releases](https://github.com/macvim-dev/macvim/releases)

### CLIでインストール
```
brew update

# Install for zsh
brew install colordiff
brew install rmtrash
brew install zsh
sudo -- sh -c 'echo '/usr/local/bin/zsh' >> /etc/shells'

# Install tmux
brew install tmux

# Vim
mkdir -p ~/.vim/bundle
mkdir ~/.vim/backup

## Install for plugins of vim
### Dein (read detail: https://github.com/Shougo/deoplete.nvim)
pip3 install neovim
pip3 install --upgrade neovim
### For ruby
gem install solargraph
pip install solargraph-utils.py --user

# Font
brew update
brew uninstall ricty
brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/

# Clone my dotfiles from github
git clone git://github.com/puriso/dotfiles ~/git/dotfiles/

# dotfiles
ln -sf ~/git/dotfiles/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/.dein.toml ~/.dein.toml
ln -sf ~/git/dotfiles/.dein_lazy.toml ~/.dein_lazy.toml
ln -sf ~/git/dotfiles/.jshintrc ~/.jshintrc
ln -sf ~/git/dotfiles/.zshrc ~/.zshrc
ln -sf ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/git/dotfiles/.gitconfig ~/.gitconfig
mv ~/.gvimrc ~/.gvimrc_original
ln -sf ~/git/dotfiles/.vimrc ~/.gvimrc
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

### デフォルトシェル変更
```
chsh -s /usr/local/bin/zsh # その後ターミナル再起動
```


