" dark2026 (Vim版): dark2026.nvim の見た目に寄せた互換カラースキーマ
" 参照先: https://github.com/D0nw0r/dark2026.nvim
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'dark2026'
set background=dark

" 基本配色
hi Normal         ctermfg=252 ctermbg=234 guifg=#d8d8d8 guibg=#1d1f27
hi CursorLine     cterm=NONE ctermbg=236 gui=NONE guibg=#2b2f3a
hi LineNr         ctermfg=242 ctermbg=234 guifg=#6f7684 guibg=#1d1f27
hi CursorLineNr   cterm=bold ctermfg=223 ctermbg=236 gui=bold guifg=#f1cd89 guibg=#2b2f3a
hi VertSplit      ctermfg=238 ctermbg=238 guifg=#3a3e4a guibg=#3a3e4a
hi StatusLine     cterm=NONE ctermfg=252 ctermbg=238 gui=NONE guifg=#d8d8d8 guibg=#3a3e4a
hi StatusLineNC   cterm=NONE ctermfg=245 ctermbg=236 gui=NONE guifg=#8a919e guibg=#2b2f3a

" 構文配色
hi Comment        ctermfg=244 gui=italic guifg=#808a9b
hi Constant       ctermfg=173 guifg=#e5a27d
hi String         ctermfg=151 guifg=#9ed06b
hi Identifier     ctermfg=111 guifg=#80cfff
hi Function       ctermfg=117 guifg=#8fddff
hi Statement      ctermfg=141 guifg=#bda0ff
hi Type           ctermfg=187 guifg=#c4cef8
hi PreProc        ctermfg=216 guifg=#ffbd73
hi Special        ctermfg=215 guifg=#ffa468

" 検索・選択
hi Visual         cterm=NONE ctermbg=60 gui=NONE guibg=#3d4463
hi Search         ctermfg=234 ctermbg=179 guifg=#1d1f27 guibg=#e2b06f
hi IncSearch      ctermfg=234 ctermbg=222 guifg=#1d1f27 guibg=#ffd09e
