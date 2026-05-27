" dark2026: Vim向けのシンプルなダークテーマ
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'dark2026'
set background=dark

hi Normal       ctermfg=252 ctermbg=234 guifg=#d0d0d0 guibg=#1c1f26
hi CursorLine   cterm=NONE ctermbg=236 gui=NONE guibg=#2a2f3a
hi LineNr       ctermfg=242 ctermbg=234 guifg=#6c7380 guibg=#1c1f26
hi CursorLineNr ctermfg=223 ctermbg=236 cterm=bold guifg=#f2cc8f guibg=#2a2f3a gui=bold
hi Comment      ctermfg=244 gui=italic guifg=#7f8a9a
hi Constant     ctermfg=173 guifg=#e6a07a
hi String       ctermfg=151 guifg=#9ece6a
hi Identifier   ctermfg=111 guifg=#7dcfff
hi Function     ctermfg=117 guifg=#89ddff
hi Statement    ctermfg=141 guifg=#bb9af7
hi Type         ctermfg=187 guifg=#c0caf5
hi PreProc      ctermfg=216 guifg=#ffb86c
hi Special      ctermfg=215 guifg=#ff9e64
hi Visual       ctermfg=NONE ctermbg=60 gui=NONE guibg=#3b4261
hi Search       ctermfg=234 ctermbg=179 guifg=#1c1f26 guibg=#e0af68
hi IncSearch    ctermfg=234 ctermbg=222 guifg=#1c1f26 guibg=#ffcf99
hi StatusLine   ctermfg=252 ctermbg=238 gui=NONE guifg=#d0d0d0 guibg=#3a3f4b
hi StatusLineNC ctermfg=245 ctermbg=236 gui=NONE guifg=#8a909c guibg=#2a2f3a
hi VertSplit    ctermfg=238 ctermbg=238 guifg=#3a3f4b guibg=#3a3f4b
