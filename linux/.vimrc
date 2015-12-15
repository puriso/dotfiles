" LINUX FOR DEVELOPMENT SERVER
"
" no plugin, minimum vimrc

" INSERT MODE KEYBIND
inoremap <silent> jj <ESC>  " jj == ESC
inoremap <silent> kk <ESC>  " kk == ESC

" Backup and Swap
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/backup
set undofile
set undodir=~/.vim/backup
" Leader Key
let mapleader = "\<Space>"
set clipboard+=unnamed
set backspace=indent,eol,start

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 行番号設定
set number
:highlight LineNr ctermfg=239
" 編集中のファイル名を表示
set title
"tab設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" ホワイトスペース可視化
set lcs=tab:>.,trail:-,extends:\

autocmd BufWritePre * :%s/\s\+$//ge " 末尾の空白を削除
set showmatch " highlight select tag
syntax on
set mouse=a

" Middleware Conf
" ------------------------------------------------------------

" PHP
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

" DB
let g:sql_type_default='mysql'
