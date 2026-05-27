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

if filereadable(expand('~/.vim/colors/dark2026.vim'))
  colorscheme dark2026
endif
