# License : MIT

# 環境変数
export LANG=ja_JP.UTF-8

# 256色のカラーパレットを表示する
target_shell=$1

if [ -z "$1" ]; then
    target_shell=$(basename "$SHELL")
fi

if [ "$target_shell" = "bash" ]; then
    bash <<< 'for code in {0..255}; do echo -n "[38;05;${code}m $(printf %03d $code)"; [ $((${code} % 16)) -eq 15 ] && echo; done'
elif [ "$target_shell" = "zsh" ]; then
    zsh  <<< 'for code in {000..255}; do print -nP -- "%F{$code}$code %f"; [ $((${code} % 16)) -eq 15 ] && echo; done'
else
    echo "error: Invalid argument ($target)"
    echo "Usage: $0 [bash|zsh]"
fi

# 補完機能を有効にする
autoload -Uz compinit
compinit

# PRONPT
PROMPT="%F{240}[%n] %~
%f%# "

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

# vim:set ft=zsh :a
#
export DYLD_LIBRARY_PATH=/usr/lib/:$DYLD_LIBRARY_PATH

