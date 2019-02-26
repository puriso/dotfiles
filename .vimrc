" ------------------------------------------------------------------------------
" Purin's
"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
" font of heading : http://patorjk.com/software/taag/#p=display&f=Ghost
" ------------------------------------------------------------------------------
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
set encoding=utf-8
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
" .-. .-')     ('-.                .-')
" \  ( OO )  _(  OO)              ( OO ).
" ,--. ,--. (,------. ,--.   ,--.(_)---\_)
" |  .'   /  |  .---'  \  `.'  / /    _ |
" |      /,  |  |    .-')     /  \  :` `.
" |     ' _)(|  '--.(OO  \   /    '..`''.)
" |  .   \   |  .--' |   /  /\_  .-._)   \
" |  |\   \  |  `---.`-./  /.__) \       /
" `--' '--'  `------'  `--'       `-----'
" ------------------------------------------------------------------------------
" Leader Key
let mapleader = "\<Space>"

" 挿入ã¢ードでバックスペースやCtrl-hを押しても何も反応がない場合の対処法
set backspace=indent,eol,start

" jj,kk = ESC
inoremap <silent> jj <ESC>  " jj == ESC
inoremap <silent> kk <ESC>  " kk == ESC

" ------------------------------------------------------------------------------
"   _ (`-.                                                .-') _   .-')
"  ( (OO  )                                              ( OO ) ) ( OO ).
" _.`     \ ,--.     ,--. ,--.     ,----.     ,-.-') ,--./ ,--,' (_)---\_)
"(__...--'' |  |.-') |  | |  |    '  .-./-')  |  |OO)|   \ |  |\ /    _ |
" |  /  | | |  | OO )|  | | .-')  |  |_( O- ) |  |  \|    \|  | )\  :` `.
" |  |_.' | |  |`-' ||  |_|( OO ) |  | .--, \ |  |(_/|  .     |/  '..`''.)
" |  .___.'(|  '---.'|  | | `-' /(|  | '. (_/,|  |_.'|  |\    |  .-._)   \
" |  |      |      |('  '-'(_.-'  |  '--'  |(_|  |   |  | \   |  \       /
" `--'      `------'  `-----'      `------'   `--'   `--'  `--'   `-----'
" ------------------------------------------------------------------------------
" [matchit] if~endif間を%ボタンで移動
source $VIMRUNTIME/macros/matchit.vim

" [tags]
set tags=./tags; "tagsファイルを上層へ探しに行く

" ------------------------------------------------------------------------------
" .-. .-')                    .-') _  _ .-') _               ('-.    .-')
" \  ( OO )                  ( OO ) )( (  OO) )            _(  OO)  ( OO ).
"  ;-----.\  ,--. ,--.   ,--./ ,--,'  \     .'_  ,--.     (,------.(_)---\_)
"  | .-.  |  |  | |  |   |   \ |  |\  ,`'--..._) |  |.-')  |  .---'/    _ |
"  | '-' /_) |  | | .-') |    \|  | ) |  |  \  ' |  | OO ) |  |    \  :` `.
"  | .-. `.  |  |_|( OO )|  .     |/  |  |   ' | |  |`-' |(|  '--.  '..`''.)
"  | |  \  | |  | | `-' /|  |\    |   |  |   / :(|  '---.' |  .--' .-._)   \
"  | '--'  /('  '-'(_.-' |  | \   |   |  '--'  / |      |  |  `---.\       /
"  `------'   `-----'    `--'  `--'   `-------'  `------'  `------' `-----'
" ------------------------------------------------------------------------------
" POWERED BY Dein.vim
" https://github.com/Shougo/dein.vim/blob/master/README.md
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" Dein.vim 自動インストール
"-------------------------------------------------------------------------------
filetype off
if has('vim_starting')
  if !isdirectory(expand("~/.cache/dein"))
    echo "install 'dein.vim'..."
    :call system("curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein.vim.installer.sh")
    :call system("sh dein.vim.installer.sh ~/.cache/dein")
    :call system("rm dein.vim.installer.sh")
  endif
endif
execute 'set runtimepath^=~/.cache/dein'
filetype plugin indent on

" ------------------------------------------------------------------------------
" Dein.vim設定
"-------------------------------------------------------------------------------
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 "----------------------------------------
 " 設定START
 "----------------------------------------
    " TOMLファイルにて管理
    call dein#load_toml('~/.dein.toml', {'lazy': 0})
    call dein#load_toml('~/.dein_lazy.toml', {'lazy': 1})
 "----------------------------------------
 " END ADD
 "----------------------------------------
 call dein#end()
 call dein#save_state()
endif

" プラグインの自動インストール
if dein#check_install()
  call dein#install()
endif

" Default filer
let g:vimfiler_as_default_explorer = 1
" VimFilerBufferDir Key
nnoremap <silent> <leader>fb  :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -auto-cd<CR>
" VimExplorer Key
nnoremap <silent> <leader>fe  :VimFilerExplorer -split -simple -winwidth=35 -no-quit -auto-cd<CR>

" Options of itchyny/lightline.vim
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'right': [ [ 'syntastic', 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \   'syntastic': 'error',
    \ }
    \ }
augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction


" ------------------------------------------------------------------------------
"              ('-.         .-') _              .-')
"             ( OO ).-.    ( OO ) )            ( OO ).
"  ,--.       / . --. /,--./ ,--,'  ,----.    (_)---\_)
"  |  |.-')   | \-.  \ |   \ |  |\ '  .-./-') /    _ |
"  |  | OO ).-'-'  |  ||    \|  | )|  |_( O- )\  :` `.
"  |  |`-' | \| |_.'  ||  .     |/ |  | .--, \ '..`''.)
" (|  '---.'  |  .-.  ||  |\    | (|  | '. (_/.-._)   \
"  |      |   |  | |  ||  | \   |  |  '--'  | \       /
"  `------'   `--' `--'`--'  `--'   `------'   `-----'
" ------------------------------------------------------------------------------

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

" ------------------------------------------------------------------------------
"             ('-.                                          .-') _
"            ( OO ).-.                                     (  OO) )
" ,--.       / . --. /  ,--.   ,--..-'),-----.  ,--. ,--.  /     '._
" |  |.-')   | \-.  \    \  `.'  /( OO'  .-.  ' |  | |  |  |'--...__)
" |  | OO ).-'-'  |  | .-')     / /   |  | |  | |  | | .-')'--.  .--'
" |  |`-' | \| |_.'  |(OO  \   /  \_) |  |\|  | |  |_|( OO )  |  |
"(|  '---.'  |  .-.  | |   /  /\_   \ |  | |  | |  | | `-' /  |  |
" |      |   |  | |  | `-./  /.__)   `'  '-'  '('  '-'(_.-'   |  |
" `------'   `--' `--'   `--'          `-----'   `-----'      `--'
" ------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" Common
"-------------------------------------------------------------------------------
" 最大色
set t_Co=256

" 各種設定
if has("mac")
    colorscheme lucius
    "colorscheme lmolokai
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
:LuciusBlack

let g:airline#extensions#statusline#enabled = 1
let g:airline#extensions#statusline#buffer_idx_mode = 1
"let g:airline_theme='papercolor' "落ち着いた色調が好き

let g:airline#extensions#branch#enabled = 1

" ------------------------------------------------------------------------------
"             ('-.       .-') _                     .-')      ('-.   .-') _
"            ( OO ).-.  (  OO) )                   ( OO ).  _(  OO) (  OO) )
" ,--.       / . --. /,(_)----.  ,--.   ,--.      (_)---\_)(,------./     '._
" |  |.-')   | \-.  \ |       |   \  `.'  /       /    _ |  |  .---'|'--...__)
" |  | OO ).-'-'  |  |'--.   /  .-')     /        \  :` `.  |  |    '--.  .--'
" |  |`-' | \| |_.'  |(_/   /  (OO  \   /          '..`''.)(|  '--.    |  |
"(|  '---.'  |  .-.  | /   /___ |   /  /\_        .-._)   \ |  .--'    |  |
" |      |   |  | |  ||        |`-./  /.__)       \       / |  `---.   |  |
" `------'   `--' `--'`--------'  `--'             `-----'  `------'   `--'
" ------------------------------------------------------------------------------

" Sysntax ON
source $VIMRUNTIME/syntax/syntax.vim
syntax enable
syntax on


nnoremap <C-g> :<C-u>Denite file_rec<CR>
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ====================
" Install tools
" ====================
" PHPLint
" JSHint
