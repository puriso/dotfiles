" Basic Conf
" --------------------------------------------------------------
" Backup and Swap
if has("mac") "
    set backup
    set backupdir=~/.vim/backup
    set swapfile
    set directory=~/.vim/backup
endif
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
" 末尾の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge
"Syntax
syntax on


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




" NeoBundle Set
" ------------------------------------------------------------
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif



" NeoBundle Plugins
" ------------------------------------------------------------

" ==========
" NeoBundles
" ==========
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : ''
        \ }

    " Plugin key-mappings.
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

NeoBundle 'Shougo/vimproc'
NeoBundleLazy 'Shougo/vimfiler'
    " Default filer
    let g:vimfiler_as_default_explorer = 1
    " VimFilerBufferDir Key
    nnoremap <silent> <leader>fb  :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
    " VimExplorer Key
    nnoremap <silent> <leader>fe  :VimFilerExplorer -split -simple -winwidth=35 -no-quit<CR>
NeoBundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2

    let g:syntastic_mode_map = {
    \ "mode" : "passive",
    \ "active_filetypes" : ["javascript", "json","php"],
    \}
    let g:syntastic_javascript_checker = "jshint"
"    augroup AutoSyntastic
"        autocmd!
"        autocmd InsertLeave,TextChanged * call s:syntastic()
"    augroup END
"    function! s:syntastic()
"        w
"        SyntasticCheck
"    endfunction
"

" FrontEnd
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'moll/vim-node'
" Close Tag Comp
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
" emmet
NeoBundle 'mattn/emmet-vim'
    let g:user_emmet_leader_key='<c-e>'

NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Townk/vim-autoclose'

call neobundle#end()

" ColorSchemes
if has("mac")
    colorscheme molokai
    highlight Normal ctermbg=none
elseif has("win64")
    colorscheme lucius
endif




" ====================
" Install tools
" ====================
" PHPLint
" JSHint
" emmet
" make vimproc
