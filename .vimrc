set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

set number
set title
set showmatch
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab

set hlsearch
set clipboard+=unnamed

syntax on
filetype plugin indent on

let s:dotfiles_dir = expand('<sfile>:p:h')
let s:repo_dark2026 = s:dotfiles_dir . '/colors/dark2026.vim'

if filereadable(expand('~/.vim/colors/dark2026.vim'))
  colorscheme dark2026
elseif filereadable(s:repo_dark2026)
  execute 'set runtimepath^=' . fnameescape(s:dotfiles_dir)
  colorscheme dark2026
endif
