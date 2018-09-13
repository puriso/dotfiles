alias tmux='tmux -u'


# 環境変数
export PATH="/opt/local/bin:$PATH"

# For git
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示


# PROMPT
PROMPT="%F{2}[%n] %F{240}%~
%f%# "

function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}


# 設定ファイル
if [ -f ~/.phpbrew/bashrc ]; then
    source ~/.phpbrew/bashrc
fi
# MacVim kaoriya
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# ゴミ箱
alias rm='rmtrash'

# 256色のカラーパレットを表示する
target_shell=$1

if [ -z "$1" ]; then
    target_shell=$(basename "$SHELL")
fi

# 補完機能を有効にする
autoload -Uz compinit
compinit


# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Vim 風キーバインドにする
bindkey -v

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# vim:set ft=zsh :a
#
#export DYLD_LIBRARY_PATH=/usr/lib/:$DYLD_LIBRARY_PATH

# SVN EDITOR
export SVN_EDITOR=vim

# FOR CORDOVA
export ANDROID_HOME=/home/jenkins/android-sdk-linux
export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/tools

#FOR CTAGS
alias ctags="`brew --prefix`/bin/ctags"


if [ -f /Users/kotake/.phpenv/bin ]; then
    export PATH="/Users/kotake/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
    export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
fi

