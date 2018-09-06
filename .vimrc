"
" Purin's .vimrc
"
" --------------------------------------------------------------
" Initialize
" --------------------------------------------------------------
" Use VIM features instead of vi
" It causes many side effects, so you need to write the top of the ".vimrc".
if &compatible
  set nocompatible
endif

" Reset Autocmd group
augroup MyAutoCmd
  autocmd!
augroup END

:source $VIMRUNTIME/syntax/syntax.vim
syntax enable
syntax on

" .vim paths
let $VIM_DOTVIM_DIR        = '~/.vim'
let $MYVIMRC               = '~/.vimrc'

let $VIM_REMOTE_BUNDLE_DIR = $VIM_DOTVIM_DIR . '/bundle'
let $VIM_LOCAL_BUNDLE_DIR  = $VIM_DOTVIM_DIR . '/local_bundle'
let $VIM_NEOBUNDLE_DIR     = $VIM_REMOTE_BUNDLE_DIR . '/neobundle.vim'

let $VIM_SWAP_DIR          = $VIM_DOTVIM_DIR . '/tmp/swap'
let $VIM_BACKUP_DIR        = $VIM_DOTVIM_DIR . '/tmp/backup'
let $VIM_UNDO_DIR          = $VIM_DOTVIM_DIR . '/tmp/undo'

" --------------------------------------------------------------
" Encoding
" --------------------------------------------------------------
let &termencoding = &encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac


" --------------------------------------------------------------
" Basic Sets
" --------------------------------------------------------------
source $VIMRUNTIME/macros/matchit.vim
set clipboard+=unnamed
set tags=./tags; "tagsファイルを上層へ探しに行く

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
let mapleader = "\<Space>"          " leader key
set backspace=indent,eol,start      " backspace

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 行番号・行色設定
set number
highlight LineNr ctermfg=239
" 編集中のファイル名を表示
set title
" TABスペース設定
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" ホワイトスペース可視化
set lcs=tab:>.,trail:-,extends:\
" Highlight serched words
set hlsearch
" 保存時に末尾の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge
" Highlight selected bracket
set showmatch

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

    set encoding=utf-8
    set fileencodings=utf-8
    set fileformats=unix,dos,mac
endif
if has("linux")
    set mouse=v
    set ttymouse=xterm2
    vmap <C-c> :w !xsel -ib<CR><CR>
    set paste

    set encoding=utf-8
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
    set guifont=MS\ Gothic:h10
    set columns=150
    set lines=65
    set ambiwidth=double
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
if has('gui_macvim')
    set showtabline=2	" タブを常に表示
    set imdisable	" IMを無効化
    set transparency=10	" 透明度を指定
    set antialias
    set guifont=Ricty:h14
    colorscheme macvim
endif


" Grepした後にquickfix-windowでGrep結果を表示
autocmd QuickFixCmdPost *grep* cwindow


" ------------------------------------------------------------
" Middleware Conf
" ------------------------------------------------------------
" ---
" PHP
" ---
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

" ---
" DB
" ---
let g:sql_type_default='mysql'


" NeoBundle Set
" ------------------------------------------------------------

filetype off
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
filetype plugin indent on






" Plugins
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
    nnoremap <silent> <leader>fb  :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -auto-cd<CR>
    " VimExplorer Key
    nnoremap <silent> <leader>fe  :VimFilerExplorer -split -simple -winwidth=35 -no-quit -auto-cd<CR>

    NeoBundle 'ngmy/vim-rubocop'
    NeoBundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=2

    let g:syntastic_mode_map = {
                \ "mode" : "passive",
                \ "active_filetypes" : ["javascript", "json","php","ruby"],
                \}
    let g:syntastic_javascript_checker = "jshint"
    let g:syntastic_ruby_checkers=['rubocop', 'mri']
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
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'nono/vim-handlebars'
" Close a tag
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
" emmet
NeoBundle 'mattn/emmet-vim'
    let g:user_emmet_leader_key='<c-e>'
    let g:user_emmet_settings = {
            \ 'variables': {
            \ 'lang' : 'ja'
        \ }
    \}

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
NeoBundle 'soramugi/auto-ctags.vim'
    let g:auto_ctags = 0
" vim-tags
NeoBundle 'szw/vim-tags'
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"

"ejs syntax
NeoBundle 'nikvdp/ejs-syntax'
    autocmd BufNewFile,BufRead *.tpl set filetype=html
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *._ejs set filetype=html

    function! s:DetectEjs()
        if getline(1) =~ '^#!.*\<ejs\>'
            set filetype=ejs
        endif
    endfunction

    autocmd BufNewFile,BufRead * call s:DetectEjs()

" Vim markdown
":PrevimOpen
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'

" 自動で折りたたまないようにする
  let g:vim_markdown_folding_disabled=1
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


NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


call neobundle#end()

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
" ctags

