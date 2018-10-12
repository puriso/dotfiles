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


