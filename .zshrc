# ---------------------------------------------------------------------------------------
#      .-') _   .-')    ('-. .-. _  .-')
#     (  OO) ) ( OO ). ( OO )  /( \( -O )
#   ,(_)----. (_)---\_),--. ,--. ,------.   .-----.
#   |       | /    _ | |  | |  | |   /`. ' '  .--./
#   '--.   /  \  :` `. |   .|  | |  /  | | |  |('-.
#   (_/   /    '..`''.)|       | |  |_.' |/_) |OO  )
#    /   /___ .-._)   \|  .-.  | |  .  '.'||  |`-'|
#.-.|        |\       /|  | |  | |  |\  \(_'  '--'\
#`-'`--------' `-----' `--' `--' `--' '--'  `-----'
# Font: http://patorjk.com/software/taag/#p=display&f=Ghost
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
#   ('-.                         ('-.      .-')
#  ( OO ).-.                    ( OO ).-. ( OO ).
#  / . --. / ,--.      ,-.-')   / . --. /(_)---\_)
#  | \-.  \  |  |.-')  |  |OO)  | \-.  \ /    _ |
#.-'-'  |  | |  | OO ) |  |  \.-'-'  |  |\  :` `.
# \| |_.'  | |  |`-' | |  |(_/ \| |_.'  | '..`''.)
#  |  .-.  |(|  '---.',|  |_.'  |  .-.  |.-._)   \
#  |  | |  | |      |(_|  |     |  | |  |\       /
#  `--' `--' `------'  `--'     `--' `--' `-----'
# ---------------------------------------------------------------------------------------
# tmux
alias tmux='tmux -u'
# rmコマンドの先をゴミ箱へ
alias rm='rmtrash'
# ctags
alias ctags="`brew --prefix`/bin/ctags"
# MacVim kaoriya
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
else
  echo "Install MacVim and Kaoriya's batch."
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
#.-. .-')     ('-.                .-')
#\  ( OO )  _(  OO)              ( OO ).
#,--. ,--. (,------. ,--.   ,--.(_)---\_)
#|  .'   /  |  .---'  \  `.'  / /    _ |
#|      /,  |  |    .-')     /  \  :` `.
#|     ' _)(|  '--.(OO  \   /    '..`''.)
#|  .   \   |  .--' |   /  /\_  .-._)   \
#|  |\   \  |  `---.`-./  /.__) \       /
#`--' '--'  `------'  `--'       `-----'
# ---------------------------------------------------------------------------------------
# Vim 風キーバインドにする
bindkey -v

# ---------------------------------------------------------------------------------------
#             ('-.                                          .-') _
#            ( OO ).-.                                     (  OO) )
# ,--.       / . --. /  ,--.   ,--..-'),-----.  ,--. ,--.  /     '._
# |  |.-')   | \-.  \    \  `.'  /( OO'  .-.  ' |  | |  |  |'--...__)
# |  | OO ).-'-'  |  | .-')     / /   |  | |  | |  | | .-')'--.  .--'
# |  |`-' | \| |_.'  |(OO  \   /  \_) |  |\|  | |  |_|( OO )  |  |
#(|  '---.'  |  .-.  | |   /  /\_   \ |  | |  | |  | | `-' /  |  |
# |      |   |  | |  | `-./  /.__)   `'  '-'  '('  '-'(_.-'   |  |
# `------'   `--' `--'   `--'          `-----'   `-----'      `--'
# ---------------------------------------------------------------------------------------
# 256色のカラーパレットを表示する
if [ -z "$1" ]; then
        target_shell=$(basename "$SHELL")
fi
target_shell=$1

# -----------------------------------------
# プロンプト
# -----------------------------------------
# Default
PROMPT="%F{2}[%n] %F{240}%~
%f%# "
# SSHログイン時のプロンプト設定
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# ---------------------------------------------------------------------------------------
#                         _  .-')         .-') _   _   .-')              ) (`-.
#                        ( \( -O )       (  OO) ) ( '.( OO )_             ( OO ).
#    ,------. .-'),-----. ,------.       /     '._ ,--.   ,--.),--. ,--. (_/.  \_)-.
# ('-| _.---'( OO'  .-.  '|   /`. '      |'--...__)|   `.'   | |  | |  |  \  `.'  /
# (OO|(_\    /   |  | |  ||  /  | |      '--.  .--'|         | |  | | .-') \     /\
# /  |  '--. \_) |  |\|  ||  |_.' |         |  |   |  |'.'|  | |  |_|( OO ) \   \ |
# \_)|  .--'   \ |  | |  ||  .  '.'         |  |   |  |   |  | |  | | `-' /.'    \_)
#.-.\|  |_)     `'  '-'  '|  |\  \          |  |   |  |   |  |('  '-'(_.-'/  .'.  \
#`-' `--'         `-----' `--' '--'         `--'   `--'   `--'  `-----'  '--'   '--'
# ---------------------------------------------------------------------------------------
# Git
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# ---------------------------------------------------------------------------------------
#               .-') _    ('-. .-.   ('-.  _  .-')    .-')
#             (  OO) )  ( OO )  / _(  OO)( \( -O )  ( OO ).
# .-'),-----. /     '._ ,--. ,--.(,------.,------. (_)---\_)
#( OO'  .-.  '|'--...__)|  | |  | |  .---'|   /`. '/    _ |
#/   |  | |  |'--.  .--'|   .|  | |  |    |  /  | |\  :` `.
#\_) |  |\|  |   |  |   |       |(|  '--. |  |_.' | '..`''.)
#  \ |  | |  |   |  |   |  .-.  | |  .--' |  .  '.'.-._)   \
#   `'  '-'  '   |  |   |  | |  | |  `---.|  |\  \ \       /
#     `-----'    `--'   `--' `--' `------'`--' '--' `-----'
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
eval "$(rbenv init -)"

# -----------------------------------------
# Apache Cordova
# -----------------------------------------
export ANDROID_HOME=/home/jenkins/android-sdk-linux
export PATH=$PATH:${ANDROID_HOME}/platforms:${ANDROID_HOME}/tools

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$PATH:./node_modules/.bin
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

eval "$(anyenv init -)"
