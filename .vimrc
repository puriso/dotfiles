" Purin's 設定ファイル
" ------------------------------------------------------------------------------
" INIT
"-------------------------------------------------------------------------------
if &compatible
 set nocompatible
endif
augroup MyAugroup
  autocmd!
augroup END
" ------------------------------------------------------------------------------
" PATHS
"-------------------------------------------------------------------------------
let $VIM_DOTVIM_DIR        = '~/.vim'
let $MYVIMRC               = '~/.vimrc'

let $VIM_REMOTE_BUNDLE_DIR = $VIM_DOTVIM_DIR . '/bundle'
let $VIM_LOCAL_BUNDLE_DIR  = $VIM_DOTVIM_DIR . '/local_bundle'

let $VIM_SWAP_DIR          = $VIM_DOTVIM_DIR . '/tmp/swap'
let $VIM_BACKUP_DIR        = $VIM_DOTVIM_DIR . '/tmp/backup'
let $VIM_UNDO_DIR          = $VIM_DOTVIM_DIR . '/tmp/undo'

" Backup and Swap
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/backup
set undofile
set undodir=~/.vim/backup

" --------------------------------------------------------------
" ENCODING => UTF8
" --------------------------------------------------------------
let &termencoding = &encoding
set fenc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac

" ------------------------------------------------------------------------------
" GENERAL SETS
"-------------------------------------------------------------------------------
" 編集中のファイル名を表示
set title

" 閲覧モード解除
set modifiable

" ------------------------------------------------------------------------------
" ヤンク・ペースト
" ------------------------------------------------------------------------------
" Clipboard
set clipboard+=unnamed
" Paste
if has("linux")
    vmap <C-c> :w !xsel -ib<CR><CR>
    set paste
endif

" ------------------------------------------------------------------------------
" 行・文字
"-------------------------------------------------------------------------------
" 行番号・行色設定
set number
highlight LineNr ctermfg=239

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 対応する括弧を強調表示
set showmatch

" 環境依存文字対策
set ambiwidth=double

" 行・フォント設定
if has("linux")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    set guifont=MS\ Gothic:h10
    set columns=150
    set lines=65
endif
if has ('win64')
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
    set guifont=MS\ Gothic:h10
    set columns=150
    set lines=65
endif

" ------------------------------------------------------------------------------
" タブ・インデント
"-------------------------------------------------------------------------------
" TABスペース設定
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" ホワイトスペース可視化
set lcs=tab:>.,trail:-,extends:\

" 保存時に末尾の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" ------------------------------------------------------------------------------
" 検索・置換
"-------------------------------------------------------------------------------
" 検索文字列をハイライトする
set hlsearch

" Grepした後にquickfix-windowでGrep結果を表示
autocmd QuickFixCmdPost *grep* cwindow

"-------------------------------------------------------------------------------
" マウス
"-------------------------------------------------------------------------------
if has("win64")
    set mouse=a
endif
if has("mac")
    set ambiwidth=double
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
if has("linux")
    set mouse=v
    set ttymouse=xterm2
endif

" ------------------------------------------------------------------------------
" キーマッピング設定セクション
" ------------------------------------------------------------------------------
" Leader Key
let mapleader = "\<Space>"

" 挿入ã¢ードでバックスペースやCtrl-hを押しても何も反応がない場合の対処法
set backspace=indent,eol,start

" jj,kk = ESC
inoremap <silent> jj <ESC>  " jj == ESC
inoremap <silent> kk <ESC>  " kk == ESC

" ------------------------------------------------------------------------------
" 補助機能・タグ設定セクション
" ------------------------------------------------------------------------------
" [matchit] if~endif間を%ボタンで移動
source $VIMRUNTIME/macros/matchit.vim

" [tags]
set tags=./tags; "tagsファイルを上層へ探しに行く

" ------------------------------------------------------------------------------
" プラグイン管理を使わない前提の基本設定
" ------------------------------------------------------------------------------
filetype plugin indent on
syntax on

" ------------------------------------------------------------------------------
" テーマ
" ------------------------------------------------------------------------------
set background=dark
silent! colorscheme backpack
if !exists('g:colors_name') || g:colors_name !=# 'backpack'
  colorscheme desert
endif

" ------------------------------------------------------------------------------
" ステータスライン
" ------------------------------------------------------------------------------
set laststatus=2


"-------------------------------------------------------------------------------
" HTML
"-------------------------------------------------------------------------------
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
autocmd BufNewFile,BufRead *.ejs set filetype  = ejs
autocmd BufNewFile,BufRead *._ejs set filetype = ejs


"-------------------------------------------------------------------------------
" JavaScript
"-------------------------------------------------------------------------------
" CoffeeScript
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

"-------------------------------------------------------------------------------
" MySQL
"-------------------------------------------------------------------------------
let g:sql_type_default='mysql'

"-------------------------------------------------------------------------------
" PHP
"-------------------------------------------------------------------------------
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

"-------------------------------------------------------------------------------
" Ruby on Rails
"-------------------------------------------------------------------------------
" au BufRead,BufNewFile,BufReadPre *.rb   set filetype=ruby
autocmd FileType ruby    setlocal sw=2 sts=2 ts=2 et
autocmd BufNewFile,BufRead *.cap setlocal ft=ruby  fenc=utf-8

"-------------------------------------------------------------------------------
" Markdown
"-------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.md set filetype = markdown
"自動折りたたみ(0:あり,1:禁止)
let g:vim_markdown_folding_disabled=1

"-------------------------------------------------------------------------------
" Others
"-------------------------------------------------------------------------------
" au BufRead,BufNewFile,BufReadPre *.rb   set filetype=ruby
autocmd FileType yml    setlocal sw=2 sts=2 ts=2 et

"-------------------------------------------------------------------------------
" Common
"-------------------------------------------------------------------------------
" 最大色
set t_Co=256

" 各種設定
if has("mac")
    highlight Normal ctermbg=none
elseif has('gui_macvim')
    set showtabline=2	" タブを常に表示
    set imdisable	" IMを無効化
    set transparency=10	" 透明度を指定
    set antialias
    set guifont=Ricty:h14
    "colorscheme macvim
endif
if has('win64')
    autocmd GUIEnter * set transparency=235 " opacity
    " set guioptions-=m "hide the menubar
    set guioptions-=T " hide the toolbar
    set cursorline " set gVim Only
    set iminsert=0
endif
" ColorSchemes
let g:lucius_style       = "dark"
let g:lucius_contrast    = "normal" "[low],[normal],[high]
let g:lucius_contrast_bg = "normal" "[normal] or [high]
" Lucius は未使用

" Sysntax ON
source $VIMRUNTIME/syntax/syntax.vim
syntax enable
syntax on


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ====================
" Install tools
" ====================
" PHPLint
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescriptreact'],
        \ })
endif
