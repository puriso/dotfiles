# ---------------------------------------------------------------------------------------
# zsh 設定ヘッダー（旧ASCIIアートを削除）
# ---------------------------------------------------------------------------------------
# 環境変数
export PATH="/opt/local/bin:$PATH"
export PATH="$PATH:/usr/local/Caskroom/"
# '#' 以降をコメントとして扱う
setopt interactive_comments
# Ctrl+Dでzshを終了しない
setopt ignore_eof
#日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 補完機能を有効にする
autoload -Uz compinit
compinit


# ---------------------------------------------------------------------------------------
# エイリアス・基本コマンド設定セクション（旧ASCIIアートを削除）
# ---------------------------------------------------------------------------------------
# tmux
# rmコマンドの先をゴミ箱へ
alias rm='rmtrash'
# ctags
alias ctags="`brew --prefix`/bin/ctags"
# MacVim kaoriya
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
elif command -v mvim >/dev/null 2>&1; then
  alias vi='env LANG=ja_JP.UTF-8 mvim -v "$@"'
  alias vim='env LANG=ja_JP.UTF-8 mvim -v "$@"'
else
  echo "MacVim が未導入です。必要に応じて MacVim と Kaoriya のバッチを導入してください。"
fi
# less
#alias -g L='| less'
# grep
alias -g G='| grep'
# diff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# ---------------------------------------------------------------------------------------
# キーバインド設定セクション（旧ASCIIアートを削除）
# ---------------------------------------------------------------------------------------
# Vim 風キーバインドにする
bindkey -v

# ---------------------------------------------------------------------------------------
# プロンプト・Starship設定セクション（旧ASCIIアートを削除）
# ---------------------------------------------------------------------------------------
# 256色のカラーパレットを表示する
if [ -z "$1" ]; then
        target_shell=$(basename "$SHELL")
fi
target_shell=$1

# -----------------------------------------
# プロンプト（Starship）
export STARSHIP_CONFIG="$HOME/.starship.toml"
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Git情報の表示は Starship に移行


# ---------------------------------------------------------------------------------------
# 言語・開発環境設定セクション（旧ASCIIアートを削除）
# ---------------------------------------------------------------------------------------

# -----------------------------------------
# tmux
# -----------------------------------------
function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}
# -----------------------------------------
# SVN
# -----------------------------------------
export SVN_EDITOR=vim

# -----------------------------------------
# PHP
# -----------------------------------------
# phpbrew & phpenv
if [ -f ~/.phpbrew/bashrc ]; then
    source ~/.phpbrew/bashrc
fi
if [ -f /Users/kotake/.phpenv/bin ]; then
    export PATH="/Users/kotake/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
    export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
fi

# -----------------------------------------
# Ruby
# -----------------------------------------
export PATH="$HOME/.rbenv/shims:$PATH"
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# -----------------------------------------
# Apache Cordova
# -----------------------------------------
export ANDROID_HOME=/home/jenkins/android-sdk-linux
export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/tools

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$PATH:./node_modules/.bin
export PATH="$HOME/.nodenv/bin:$PATH"
if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

if command -v anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

# -----------------------------------------
# tmux 関数（Starship確認つき）
# -----------------------------------------
tmux() {
  # tmux 起動時に starship がなければ Homebrew で導入を試みる
  if ! command -v starship >/dev/null 2>&1; then
    if command -v brew >/dev/null 2>&1; then
      echo "starship が見つからないため、brew install starship を実行します。"
      brew install starship
    else
      echo "starship が見つかりません。Homebrew も見つからないため自動インストールできません。"
    fi
  fi

  command tmux -u "$@"
}
