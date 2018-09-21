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
let $VIM_NEOBUNDLE_DIR     = $VIM_REMOTE_BUNDLE_DIR . '/neobundle.vim'

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
" Sysntax ON
:source $VIMRUNTIME/syntax/syntax.vim
syntax enable
syntax on
" 編集中のファイル名を表示
set title

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
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

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

" 挿入モードでバックスペースやCtrl-hを押しても何も反応がない場合の対処法
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
 endif
 "----------------------------------------
 " END ADD
 "----------------------------------------
 call dein#end()
 call dein#save_state()
endif




autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
autocmd BufNewFile,BufRead *.ejs set filetype  = ejs
autocmd BufNewFile,BufRead *._ejs set filetype = ejs
autocmd BufRead,BufNewFile *.md set filetype = markdown


"
"
"
"
"
"
"
"
"
"
"
"" Check NeoBundle have already been installed
"filetype off
"if has('vim_starting')
"  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
"    echo "install neobundle..."
"    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
"  endif
"  set runtimepath+=~/.vim/bundle/neobundle.vim
"endif
"
"call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"filetype plugin indent on
"
"" gitラッパープラグイン
"NeoBundle 'tpope/vim-fugitive'
"" vim 用の統合ユーザインターフェース
"NeoBundle 'Shougo/unite.vim'
"" 入力補完機能
"NeoBundle 'Shougo/neocomplcache'
"    " Disable AutoComplPop.
"    let g:acp_enableAtStartup = 0
"    " Use neocomplcache.
"    let g:neocomplcache_enable_at_startup = 1
"    " Use smartcase.
"    let g:neocomplcache_enable_smart_case = 1
"    " Set minimum syntax keyword length.
"    let g:neocomplcache_min_syntax_length = 3
"    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"    " Define dictionary.
"    let g:neocomplcache_dictionary_filetype_lists = {
"        \ 'default' : ''
"        \ }
"
"    " Plugin key-mappings.
"    "inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"    " Recommended key-mappings.
"    " <CR>: close popup and save indent.
"    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"    function! s:my_cr_function()
"      return neocomplcache#smart_close_popup() . "\<CR>"
"    endfunction
"    " <TAB>: completion.
"    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"    " <C-h>, <BS>: close popup and delete backword char.
"    " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"    " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"    inoremap <expr><C-y>  neocomplcache#close_popup()
"    inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" 非同期処理
"NeoBundle 'Shougo/vimproc'
"" ファイラー
"NeoBundleLazy 'Shougo/vimfiler'
"    " Default filer
"    let g:vimfiler_as_default_explorer = 1
"    " VimFilerBufferDir Key
"    nnoremap <silent> <leader>fb  :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -auto-cd<CR>
"    " VimExplorer Key
"    nnoremap <silent> <leader>fe  :VimFilerExplorer -split -simple -winwidth=35 -no-quit -auto-cd<CR>
"    NeoBundle 'scrooloose/syntastic'
"    let g:syntastic_enable_signs=1
"    let g:syntastic_auto_loc_list=2
"
"    let g:syntastic_mode_map = {
"                \ "mode" : "passive",
"                \ "active_filetypes" : ["javascript", "json","php"],
"                \}
"    let g:syntastic_javascript_checker = "jshint"
"
""    augroup AutoSyntastic
""        autocmd!
""        autocmd InsertLeave,TextChanged * call s:syntastic()
""    augroup END
""    function! s:syntastic()
""        w
""        SyntasticCheck
""    endfunction
""
"
"" ------------------------------------------------------------------------------
"" Frontend
""-------------------------------------------------------------------------------
"" CSS3 Syntax
"NeoBundle 'hail2u/vim-css3-syntax'
"" URL形式をブラウザで開く
"NeoBundle 'tyru/open-browser.vim'
"" HTTP通信機能
"NeoBundle 'mattn/webapi-vim'
"" ブラウザ自動リロード
"if has("mac")
"    NeoBundle 'tell-k/vim-browsereload-mac'
"endif
"" HTML閉じタグ自動補完
"autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
"" Emmet設定
"NeoBundle 'mattn/emmet-vim'
"    let g:user_emmet_leader_key='<c-e>'
"    let g:user_emmet_settings = {
"            \ 'variables': {
"            \ 'lang' : 'ja'
"        \ }
"    \}
"" スキーマ着せ替えプラグイン
"NeoBundle 'ujihisa/unite-colorscheme'
"" Vimからシェルを起動するVimScript
"NeoBundle 'Shougo/vimshell'
"" ファイルの構文エラーをチェック
"NeoBundle 'scrooloose/syntastic.git'
"" インデント可視化
"NeoBundle 'nathanaelkane/vim-indent-guides'
"" クオートや括弧の自動補完
"NeoBundle 'Townk/vim-autoclose'
"" Tagsファイル作成コマンド
"NeoBundle 'soramugi/auto-ctags.vim'
"    let g:auto_ctags = 1 "0:自動作成無効 1:自動作成有効
"    let g:auto_ctags_directory_list = ['.git', '.svn'] "tagsを作成するディレクトリを指定
"    let g:auto_ctags_filetype_mode = 1 "ファイルタイプ専用のtagsを自動作成
""EJS syntax
"NeoBundle 'nikvdp/ejs-syntax'
"    autocmd BufNewFile,BufRead *.ejs set filetype=ejs
"    autocmd BufNewFile,BufRead *._ejs set filetype=ejs
"    function! s:DetectEjs()
"        if getline(1) =~ '^#!.*\<ejs\>'
"            set filetype=ejs
"        endif
"    endfunction
"
"    autocmd BufNewFile,BufRead * call s:DetectEjs()
"" Markdown構築
"NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'kannokanno/previm'
"    au BufRead,BufNewFile *.md set filetype=markdown
"" ステータスラインカスタム
"NeoBundle 'itchyny/lightline.vim'
"    set laststatus=2
"    let g:lightline = {
"        \ 'colorscheme': 'wombat',
"        \ 'active': {
"        \   'right': [ [ 'syntastic', 'lineinfo' ],
"        \              [ 'percent' ],
"        \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
"        \ },
"        \ 'component_expand': {
"        \   'syntastic': 'SyntasticStatuslineFlag',
"        \ },
"        \ 'component_type': {
"        \   'syntastic': 'error',
"        \ }
"        \ }
"    augroup AutoSyntastic
"        autocmd!
"        autocmd BufWritePost *.c,*.cpp call s:syntastic()
"    augroup END
"    function! s:syntastic()
"        SyntasticCheck
"        call lightline#update()
"    endfunction
"" JavaScript Syntax
"NeoBundle 'jelera/vim-javascript-syntax'
""ckfixウィンドウ内でrを押すと、各行のテキスト部分が別バッファに書き出されるプラグイン
"NeoBundle "thinca/vim-qfreplace"
"
"" テキスト整形
"NeoBundle 'junegunn/vim-easy-align'
"    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
"    vmap <Enter> <Plug>(EasyAlign)
"    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
"    nmap ga <Plug>(EasyAlign)
"
"" Neobundle END
"call neobundle#end()
"
"
"" Check NeoBundleInstall
"" --------------------------------------------------------------
"if(!empty(neobundle#get_not_installed_bundle_names()))
"  echomsg 'Not installed bundles: '
"    \ string(neobundle#get_not_installed_bundle_names())
"  if confirm('Install bundles now?', "yes\nNo", 2) == 1
"    " vimrc を再度読み込み、インストールした Bundle を有効化
"    " vimrc は必ず再読み込み可能な形式で記述すること
"    NeoBundleInstall
"    source ~/.vimrc
"  endif
"end



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
"
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
" Markdown
"-------------------------------------------------------------------------------
"自動折りたたみ(0:あり,1:禁止)
let g:vim_markdown_folding_disabled=1


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
" ColorSchemes
set t_Co=256
if has("mac")
    let g:lucius_style       = "dark"
    let g:lucius_contrast    = "normal" "[low],[normal],[high]
    let g:lucius_contrast_bg = "normal" "[normal] or [high]
    colorscheme lucius
    "colorscheme lmolokai
    highlight Normal ctermbg=none
endif
if has("linux")
    let g:lucius_style       = "dark"
    let g:lucius_contrast    = "normal" "[low],[normal],[high]
    let g:lucius_contrast_bg = "normal" "[normal] or [high]
    colorscheme lucius
endif
if has('win64')
    colorscheme lucius
endif

"-------------------------------------------------------------------------------
" windows
"-------------------------------------------------------------------------------
if has ('win64')
    autocmd GUIEnter * set transparency=235 " opacity
    " set guioptions-=m "hide the menubar
    set guioptions-=T " hide the toolbar
    set cursorline " set gVim Only
    set iminsert=0
endif

"-------------------------------------------------------------------------------
" MacVim
"-------------------------------------------------------------------------------
if has('gui_macvim')  "Vim of GUI
    set showtabline=2	" タブを常に表示
    set imdisable	" IMを無効化
    set transparency=10	" 透明度を指定
    set antialias
    set guifont=Ricty:h14
    colorscheme macvim
endif



"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


" ====================
" Install tools
" ====================
" PHPLint
" JSHint
" make vimproc
" ctags
