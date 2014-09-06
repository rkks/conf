" DETAILS : My vim color file
" REVISION: 1.0
" AUTHOR  : Ravikiran K.S., ravikirandotks@gmail.com
" CREATED : 04/04/2013 22:48:10 IST
" MODIFIED: 02/24/14 12:11:03 IST
" A good way to test colorscheme without leaving editor:
" :w<CR>
" :so %<CR>

"these lines are suggested to be at the top of every colorscheme

"Clear the colors for any items that you don't like
highlight clear
if version > 580
    " no guarantees for version 5.8 & below, but this makes it stop complaining
    if exists("syntax_on")
        syntax reset
    endif
endif
" Name of the colorscheme
let g:colors_name = "rkks"
"Load the 'base' colorscheme
"runtime colors/blue.vim

set background&
let &t_Co=256

"Set up your new & improved colors
if &background == "light"
    if &t_Co > 255
        " syntax highlighting groups. 256 colors.
        highlight Comment       cterm=none ctermbg=none ctermfg=241 gui=none guibg=none guifg=none
        highlight Statement     cterm=none ctermbg=none ctermfg=91 gui=none guibg=none guifg=none
        highlight Constant      cterm=none ctermbg=none ctermfg=88 gui=none guibg=none guifg=none
        highlight Identifier    cterm=none ctermbg=none ctermfg=94 gui=none guibg=none guifg=none
        highlight Preproc       cterm=none ctermbg=none ctermfg=39 gui=none guibg=none guifg=none
        highlight Type          cterm=none ctermbg=none ctermfg=96 gui=none guibg=none guifg=none
        highlight Special       cterm=none ctermbg=none ctermfg=66 gui=none guibg=none guifg=none
        highlight Underlined    cterm=none ctermbg=none ctermfg=112 gui=none guibg=none guifg=none
        highlight Error         cterm=none ctermbg=178 ctermfg=16 gui=none guibg=none guifg=none
        highlight Todo          cterm=none ctermbg=223 ctermfg=16 gui=none guibg=none guifg=none

        " Don't alter normal. Otherwise, it will leave traces on commandline.
        "highlight Normal        cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight WarningMsg    cterm=none ctermbg=178 ctermfg=16 gui=none guibg=none guifg=none
        highlight DiffAdd       cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight CursorIM      cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight LineNr        cterm=none ctermbg=none ctermfg=100 gui=none guibg=none guifg=none
        highlight MatchParen    cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight ColorColumn   cterm=none ctermbg=254 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        cterm=none ctermbg=253 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     cterm=none ctermbg=none ctermfg=88 gui=none guibg=none guifg=none
"        highlight Search        cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
"        highlight IncSearch     cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
    else
        " syntax highlighting groups. 16 colors.
        highlight Comment       cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight Statement     cterm=none ctermbg=none ctermfg=4 gui=none guibg=none guifg=none
        highlight Constant      cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
        highlight Identifier    cterm=none ctermbg=none ctermfg=12 gui=none guibg=none guifg=none
        highlight Preproc       cterm=none ctermbg=none ctermfg=6 gui=none guibg=none guifg=none
        highlight Type          cterm=none ctermbg=none ctermfg=5 gui=none guibg=none guifg=none
        highlight Special       cterm=none ctermbg=none ctermfg=2 gui=none guibg=none guifg=none
        highlight Underlined    cterm=none ctermbg=none ctermfg=14 gui=none guibg=none guifg=none
        highlight Error         cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight Todo          cterm=none ctermbg=13 ctermfg=0 gui=none guibg=none guifg=none

        highlight WarningMsg    cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight DiffAdd       cterm=none ctermbg=12 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    cterm=none ctermbg=13 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      cterm=none ctermbg=11 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight CursorIM      cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight LineNr        cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight MatchParen    cterm=none ctermbg=14 ctermfg=15 gui=none guibg=none guifg=none
        highlight ColorColumn   cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
"        highlight Search        cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
"        highlight IncSearch     cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
    endif
else
    if &t_Co > 255
        " syntax highlighting groups. 256 colors.
        highlight Comment       cterm=none ctermbg=none ctermfg=242 gui=none guibg=none guifg=none
        highlight Statement     cterm=none ctermbg=none ctermfg=26 gui=none guibg=none guifg=none
        highlight Constant      cterm=none ctermbg=none ctermfg=124 gui=none guibg=none guifg=none
        highlight Identifier    cterm=none ctermbg=none ctermfg=56 gui=none guibg=none guifg=none
        highlight Preproc       cterm=none ctermbg=none ctermfg=24 gui=none guibg=none guifg=none
        highlight Type          cterm=none ctermbg=none ctermfg=126 gui=none guibg=none guifg=none
        highlight Special       cterm=none ctermbg=none ctermfg=52 gui=none guibg=none guifg=none
        highlight Underlined    cterm=none ctermbg=none ctermfg=111 gui=none guibg=none guifg=none
        highlight Error         cterm=none ctermbg=160 ctermfg=16 gui=none guibg=none guifg=none
        highlight Todo          cterm=none ctermbg=217 ctermfg=16 gui=none guibg=none guifg=none

        " Don't alter normal. Otherwise, it will leave traces on commandline.
        "highlight Normal        cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight WarningMsg    cterm=none ctermbg=166 ctermfg=16 gui=none guibg=none guifg=none
        highlight DiffAdd       cterm=none ctermbg=222 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    cterm=none ctermbg=211 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    cterm=none ctermbg=228 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      cterm=none ctermbg=209 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight CursorIM      cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight LineNr        cterm=none ctermbg=none ctermfg=100 gui=none guibg=none guifg=none
        highlight MatchParen    cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight ColorColumn   cterm=none ctermbg=254 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        cterm=none ctermbg=253 ctermfg=none gui=none guibg=none guifg=none
        highlight Search        cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
        highlight IncSearch     cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     cterm=none ctermbg=none ctermfg=88 gui=none guibg=none guifg=none
    else
        " syntax highlighting groups. 16 colors.
        highlight Comment       cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight Statement     cterm=none ctermbg=none ctermfg=4 gui=none guibg=none guifg=none
        highlight Constant      cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
        highlight Identifier    cterm=none ctermbg=none ctermfg=12 gui=none guibg=none guifg=none
        highlight Preproc       cterm=none ctermbg=none ctermfg=6 gui=none guibg=none guifg=none
        highlight Type          cterm=none ctermbg=none ctermfg=5 gui=none guibg=none guifg=none
        highlight Special       cterm=none ctermbg=none ctermfg=2 gui=none guibg=none guifg=none
        highlight Underlined    cterm=none ctermbg=none ctermfg=14 gui=none guibg=none guifg=none
        highlight Error         cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight Todo          cterm=none ctermbg=13 ctermfg=0 gui=none guibg=none guifg=none

        highlight WarningMsg    cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight DiffAdd       cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    cterm=none ctermbg=13 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      cterm=none ctermbg=9 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight CursorIM      cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight LineNr        cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight MatchParen    cterm=none ctermbg=14 ctermfg=15 gui=none guibg=none guifg=none
        highlight ColorColumn   cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight Search        cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
        highlight IncSearch     cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
    endif
endif

" Unused
"highlight <group-name> cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
"    highlight ErrorMsg
"    highlight FoldColumn
"    highlight ModeMsg
"    highlight MoreMsg
"    highlight NonText
"    highlight Question
"    highlight SpecialKey
"    highlight Title
"    highlight VisualNOS
"    highlight WildMenu
"    highlight Menu
"    highlight Scrollbar
"    highlight Tooltip

