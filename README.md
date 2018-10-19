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

# Install tmux & for tmux
brew install tmux
brew install reattach-to-user-namespace

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
brew install --vim-powerline ricty
cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/

# Clone my dotfiles from github
git clone git://github.com/puriso/dotfiles ~/git/dot/

# dotfiles
ln -sf ~/git/dot/.vimrc ~/.vimrc
ln -sf ~/git/dot/.dein.toml ~/.dein.toml
ln -sf ~/git/dot/.dein_lazy.toml ~/.dein_lazy.toml
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

### デフォルトシェル変更
```
chsh -s /usr/local/bin/zsh # その後ターミナル再起動
```


