#!/usr/bin/env bash
set -euo pipefail

# Standalone installer for Unix系OS
# Original version is created by shoma2da
# https://github.com/shoma2da/neobundle_installer

if [ "$#" -ne 1 ]; then
  echo "インストール先ディレクトリを1つ指定してください。"
  exit 1
fi

# インストール先を絶対パスに変換
case "$1" in
  /*) PLUGIN_DIR="$1" ;;
  *) PLUGIN_DIR="$PWD/$1" ;;
esac

INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"
echo "Install to \"$INSTALL_DIR\"..."
if [ -e "$INSTALL_DIR" ]; then
  echo "\"$INSTALL_DIR\" already exists!"
fi

echo ""

# gitコマンドの存在確認
if ! command -v git >/dev/null 2>&1; then
  echo 'Please install git or update your path to include the git executable!'
  exit 1
fi
echo ""

# プラグインディレクトリを作成してdeinを取得
if [ ! -e "$INSTALL_DIR" ]; then
  echo "Begin fetching dein..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done."
  echo ""
fi

# 初期設定を出力
echo "Please add the following settings for dein to the top of your vimrc (Vim) or init.vim (NeoVim) file:"
cat <<SETTINGS

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$INSTALL_DIR

" Required:
if dein#load_state('$PLUGIN_DIR')
  call dein#begin('$PLUGIN_DIR')

  " Let dein manage dein
  " Required:
  call dein#add('$INSTALL_DIR')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

SETTINGS

echo "Done."
echo "Complete setup dein!"
