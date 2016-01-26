" Vim starting
" --------------------------------------------------------------


" Basic Conf
" --------------------------------------------------------------
" $HOME
if has ('win64')
    let $HOME=$USERPROFILE
endif
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
" インデント表示
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 行番号設定
set number
highlight LineNr ctermfg=239
" 編集中のファイル名を表示
set title
"tab設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" ホワイトスペース可視化
set lcs=tab:>.,trail:-,extends:\
" search highlight
set hlsearch

autocmd BufWritePre * :%s/\s\+$//ge " 末尾の空白を削除
set showmatch " highlight select tag
syntax on
if has("win64")
    set mouse=a
endif

if has("mac")
    set mouse=a
endif
if has("unix")
    set mouse=v
endif
" font size + line height
if has ('win64')
    set encoding=utf-8
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
    set guifont=MS\ Gothic:h10
    set columns=150
    set lines=65
    set ambiwidth=double
endif
"GUI for gVim
if has ('win64')
    autocmd GUIEnter * set transparency=235 " opacity
    " set guioptions-=m "hide the menubar
    set guioptions-=T " hide the toolbar
    set cursorline " set gVim Only
    set iminsert=0
endif

"Grep
autocmd QuickFixCmdPost *grep* cwindow "自動的にquickfix-windowを開く

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
filetype off                   " Required!

" Check NeoBundle have already been installed
if has('vim_starting')
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

filetype plugin indent on     " Required!





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
    "inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    " inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
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
"NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'moll/vim-node'
NeoBundle 'nono/vim-handlebars'
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

" Vim markdown
":PrevimOpen
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown

NeoBundle 'itchyny/lightline.vim'
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
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle "thinca/vim-qfreplace"

call neobundle#end()

" ColorSchemes
if has("mac")
    set t_Co=256
    colorscheme molokai
    highlight Normal ctermbg=none
endif
if has("unix")
    set t_Co=256
    let g:lucius_style       = "dark"
    let g:lucius_contrast    = "normal" "[low],[normal],[high]
    let g:lucius_contrast_bg = "normal" "[normal] or [high]
    colorscheme lucius
endif
if has('win64')
    set t_Co=256
    colorscheme lucius
endif



" Check NeoBundleInstall
" --------------------------------------------------------------
if(!empty(neobundle#get_not_installed_bundle_names()))
  echomsg 'Not installed bundles: '
    \ string(neobundle#get_not_installed_bundle_names())
  if confirm('Install bundles now?', "yes\nNo", 2) == 1
    " vimrc を再度読み込み、インストールした Bundle を有効化
    " vimrc は必ず再読み込み可能な形式で記述すること
    NeoBundleInstall
    source ~/.vimrc
  endif
end


" ====================
" Install tools
" ====================
" PHPLint
" JSHint
" make vimproc
