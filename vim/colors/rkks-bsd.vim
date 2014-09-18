" DETAILS : My vim color file
" REVISION: 1.0
" AUTHOR  : Ravikiran K.S., ravikirandotks@gmail.com
" CREATED : 04/04/2013 22:48:10 IST
" MODIFIED: 09/16/14 19:00:52 IST
" A good way to test colorscheme without leaving editor: :w<CR> and then :so %<CR>

" These lines are suggested to be at the top of every colorscheme
if has("gui_running")
    finish
endif

" Clear the colors for any items that you don't like
highlight clear
if version > 580
    " no guarantees for version 5.8 & below, but this makes it stop complaining
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name = "rkks"  " Name of the colorscheme
"runtime colors/blue.vim    " Load the 'base' colorscheme

set background&
let &t_Co=256

"Set up your new & improved colors
"highlight <group-name> term=none cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE guifg=NONE
if &background == "light"
    if &t_Co > 255
        " syntax highlighting groups. 256 colors.
        highlight Comment       term=none cterm=none ctermbg=none ctermfg=241 gui=none guibg=none guifg=none
        highlight Statement     term=none cterm=none ctermbg=none ctermfg=91 gui=none guibg=none guifg=none
        highlight Constant      term=none cterm=none ctermbg=none ctermfg=88 gui=none guibg=none guifg=none
        highlight Identifier    term=none cterm=none ctermbg=none ctermfg=94 gui=none guibg=none guifg=none
        highlight Preproc       term=none cterm=none ctermbg=none ctermfg=39 gui=none guibg=none guifg=none
        highlight Type          term=none cterm=none ctermbg=none ctermfg=96 gui=none guibg=none guifg=none
        highlight Special       term=none cterm=none ctermbg=none ctermfg=66 gui=none guibg=none guifg=none
        highlight Underlined    term=none cterm=none ctermbg=none ctermfg=112 gui=none guibg=none guifg=none
        highlight Error         term=none cterm=none ctermbg=178 ctermfg=16 gui=none guibg=none guifg=none
        highlight Todo          term=none cterm=none ctermbg=223 ctermfg=16 gui=none guibg=none guifg=none

        " Don't alter normal. Otherwise, it will leave traces on commandline.
        "highlight Normal        term=none cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight WarningMsg    term=none cterm=none ctermbg=178 ctermfg=16 gui=none guibg=none guifg=none
        highlight DiffAdd       term=none cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    term=none cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    term=none cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      term=none cterm=none ctermbg=100 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        term=none cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight CursorIM      term=none cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight LineNr        term=none cterm=none ctermbg=none ctermfg=100 gui=none guibg=none guifg=none
        highlight MatchParen    term=none cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight ColorColumn   term=none cterm=none ctermbg=254 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        term=none cterm=none ctermbg=253 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     term=none cterm=none ctermbg=none ctermfg=88 gui=none guibg=none guifg=none
"        highlight Search        term=none cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
"        highlight IncSearch     term=none cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
    else
        " syntax highlighting groups. 16 colors.
        highlight Comment       term=none cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight Statement     term=none cterm=none ctermbg=none ctermfg=4 gui=none guibg=none guifg=none
        highlight Constant      term=none cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
        highlight Identifier    term=none cterm=none ctermbg=none ctermfg=12 gui=none guibg=none guifg=none
        highlight Preproc       term=none cterm=none ctermbg=none ctermfg=6 gui=none guibg=none guifg=none
        highlight Type          term=none cterm=none ctermbg=none ctermfg=5 gui=none guibg=none guifg=none
        highlight Special       term=none cterm=none ctermbg=none ctermfg=2 gui=none guibg=none guifg=none
        highlight Underlined    term=none cterm=none ctermbg=none ctermfg=14 gui=none guibg=none guifg=none
        highlight Error         term=none cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight Todo          term=none cterm=none ctermbg=13 ctermfg=0 gui=none guibg=none guifg=none

        highlight WarningMsg    term=none cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight DiffAdd       term=none cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    term=none cterm=none ctermbg=13 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    term=none cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      term=none cterm=none ctermbg=9 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        term=none cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight CursorIM      term=none cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight LineNr        term=none cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight MatchParen    term=none cterm=none ctermbg=14 ctermfg=15 gui=none guibg=none guifg=none
        highlight ColorColumn   term=none cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        term=none cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     term=none cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
"        highlight Search        term=none cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
"        highlight IncSearch     term=none cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
    endif
else
    if &t_Co > 255
        " syntax highlighting groups. 256 colors.
        highlight Comment       term=none cterm=none ctermbg=none ctermfg=242 gui=none guibg=none guifg=none
        highlight Statement     term=none cterm=none ctermbg=none ctermfg=26 gui=none guibg=none guifg=none
        highlight Constant      term=none cterm=none ctermbg=none ctermfg=124 gui=none guibg=none guifg=none
        highlight Identifier    term=none cterm=none ctermbg=none ctermfg=56 gui=none guibg=none guifg=none
        highlight Preproc       term=none cterm=none ctermbg=none ctermfg=24 gui=none guibg=none guifg=none
        highlight Type          term=none cterm=none ctermbg=none ctermfg=126 gui=none guibg=none guifg=none
        highlight Special       term=none cterm=none ctermbg=none ctermfg=52 gui=none guibg=none guifg=none
        highlight Underlined    term=none cterm=none ctermbg=none ctermfg=111 gui=none guibg=none guifg=none
        highlight Error         term=none cterm=none ctermbg=160 ctermfg=16 gui=none guibg=none guifg=none
        highlight Todo          term=none cterm=none ctermbg=217 ctermfg=16 gui=none guibg=none guifg=none

        " Don't alter normal. Otherwise, it will leave traces on commandline.
        "highlight Normal        term=none cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        highlight WarningMsg    term=none cterm=none ctermbg=166 ctermfg=16 gui=none guibg=none guifg=none
        highlight DiffAdd       term=none cterm=none ctermbg=222 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    term=none cterm=none ctermbg=211 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    term=none cterm=none ctermbg=228 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      term=none cterm=none ctermbg=209 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        term=none cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight CursorIM      term=none cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight LineNr        term=none cterm=none ctermbg=none ctermfg=100 gui=none guibg=none guifg=none
        highlight MatchParen    term=none cterm=none ctermbg=33 ctermfg=255 gui=none guibg=none guifg=none
        highlight ColorColumn   term=none cterm=none ctermbg=254 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        term=none cterm=none ctermbg=250 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        term=none cterm=none ctermbg=253 ctermfg=none gui=none guibg=none guifg=none
        highlight Search        term=none cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
        highlight IncSearch     term=none cterm=none ctermbg=184 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     term=none cterm=none ctermbg=none ctermfg=88 gui=none guibg=none guifg=none
    else
        " syntax highlighting groups. 16 colors.
        highlight Comment       term=none cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight Statement     term=none cterm=none ctermbg=none ctermfg=4 gui=none guibg=none guifg=none
        highlight Constant      term=none cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
        highlight Identifier    term=none cterm=none ctermbg=none ctermfg=12 gui=none guibg=none guifg=none
        highlight Preproc       term=none cterm=none ctermbg=none ctermfg=6 gui=none guibg=none guifg=none
        highlight Type          term=none cterm=none ctermbg=none ctermfg=5 gui=none guibg=none guifg=none
        highlight Special       term=none cterm=none ctermbg=none ctermfg=2 gui=none guibg=none guifg=none
        highlight Underlined    term=none cterm=none ctermbg=none ctermfg=14 gui=none guibg=none guifg=none
        highlight Error         term=none cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight Todo          term=none cterm=none ctermbg=13 ctermfg=0 gui=none guibg=none guifg=none

        highlight WarningMsg    term=none cterm=none ctermbg=9 ctermfg=0 gui=none guibg=none guifg=none
        highlight DiffAdd       term=none cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffChange    term=none cterm=none ctermbg=13 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffDelete    term=none cterm=none ctermbg=14 ctermfg=none gui=none guibg=none guifg=none
        highlight DiffText      term=none cterm=none ctermbg=9 ctermfg=none gui=none guibg=none guifg=none
        highlight Cursor        term=none cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight CursorIM      term=none cterm=none ctermbg=3 ctermfg=15 gui=none guibg=none guifg=none
        highlight LineNr        term=none cterm=none ctermbg=none ctermfg=8 gui=none guibg=none guifg=none
        highlight MatchParen    term=none cterm=none ctermbg=14 ctermfg=15 gui=none guibg=none guifg=none
        highlight ColorColumn   term=none cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLine    term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight StatusLineNC  term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight VertSplit     term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Folded        term=none cterm=none ctermbg=8 ctermfg=none gui=none guibg=none guifg=none
        highlight Visual        term=none cterm=none ctermbg=7 ctermfg=none gui=none guibg=none guifg=none
        highlight Search        term=none cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
        highlight IncSearch     term=none cterm=none ctermbg=3 ctermfg=none gui=none guibg=none guifg=none
        highlight Directory     term=none cterm=none ctermbg=none ctermfg=1 gui=none guibg=none guifg=none
    endif
endif

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
