let g:vimroom_width = 140
let g:vimroom_min_sidebar_width = 5
let g:vimroom_sidebar_height = 3
let g:vimroom_background = "black"

" Given the desired column width, and minimum sidebar width, determine
" the minimum window width necessary for splitting to make sense
let s:minwidth = g:vimroom_width + ( g:vimroom_min_sidebar_width * 2 )

function! s:sidebar_size()
    return ( winwidth( winnr() ) - g:vimroom_width - 2 ) / 2
endfunction

function! s:is_the_screen_wide_enough()
    return winwidth( winnr() ) >= s:minwidth
endfunction

function! s:vertical_sidebar()
    let s:sidebar = s:sidebar_size()

    " Create the left sidebar
    exec( "silent leftabove " . s:sidebar . "vsplit new" )
    set noma
    set nocursorline
    wincmd l

    " Create the right sidebar
    exec( "silent rightbelow " . s:sidebar . "vsplit new" )
    set noma
    set nocursorline
    wincmd h
endfunction

function! s:horizontal_sidebar()
    " Create the top sidebar
    exec( "silent leftabove " . g:vimroom_sidebar_height . "split new" )
    set noma 
    set nocursorline
    wincmd j

    " Create the bottom sidebar
    exec( "silent rightbelow " . g:vimroom_sidebar_height . "split new" )
    set noma
    set nocursorline
    wincmd k
endfunction

" Setup wrapping, line breaking, and push the cursor down
set wrap
set nolist
set linebreak
"set nonumber
set wrapmargin=0
set textwidth=0
set columns=140
set scrolloff=999

" Setup navigation over "display lines", not "logical lines" if
" mappings for the navigation keys don't already exist.
noremap     <unique> <silent> <Up> g<Up>
noremap     <unique> <silent> <Down> g<Down>
noremap     <unique> <silent> k gk
noremap     <unique> <silent> j gj
inoremap    <unique> <silent> <Up> <C-o>g<Up>
inoremap    <unique> <silent> <Down> <C-o>g<Down>

function! VimRoom()
let g:colors_name="vimroom"
" Hide distracting visual elements
exec( "hi VertSplit ctermbg=" . g:vimroom_background . " ctermfg=" . g:vimroom_background . " guifg=" . g:vimroom_background . " guibg=" . g:vimroom_background )
exec( "hi NonText ctermbg=" . g:vimroom_background . " ctermfg=" . g:vimroom_background . " guifg=" . g:vimroom_background . " guibg=" . g:vimroom_background )
exec( "hi StatusLine ctermbg=" . g:vimroom_background . " ctermfg=" . g:vimroom_background . " guifg=" . g:vimroom_background . " guibg=" . g:vimroom_background )
exec( "hi StatusLineNC ctermbg=" . g:vimroom_background . " ctermfg=" . g:vimroom_background . " guifg=" . g:vimroom_background . " guibg=" . g:vimroom_background )
endfunction

function! DarkRoom()
    set background=dark     "or light
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
    let g:colors_name="darkroom"
    hi LineNr       term=bold gui=bold guifg=green guibg=black
    hi LineNr       term=bold cterm=bold ctermfg=green ctermbg=black
    hi Normal       ctermfg=Green ctermbg=Black
    hi Normal       guifg=Green guibg=Black
    hi NonText      ctermfg=black  ctermbg=Black
    hi NonText      guifg=black  guibg=Black

    hi Statement    ctermfg=DarkCyan      ctermbg=Black
    hi Statement    guifg=DarkCyan      guibg=Black
    hi Comment      ctermfg=darkgreen  ctermbg=Black cterm=bold term=bold
    hi Comment      guifg=darkgreen  guibg=Black gui=bold term=bold
    hi Constant     ctermfg=DarkCyan  ctermbg=Black
    hi Constant     guifg=DarkCyan  guibg=Black
    hi Identifier   ctermfg=Green      ctermbg=Black
    hi Identifier   guifg=Green      guibg=Black
    hi Type         ctermfg=DarkCyan ctermbg=Black
    hi Type         guifg=DarkCyan guibg=Black
    hi String       ctermfg=Cyan ctermbg=black
    hi String       guifg=Cyan guibg=Black
    hi Boolean      ctermfg=DarkCyan ctermbg=Black
    hi Boolean      guifg=DarkCyan guibg=Black
    hi Number       ctermfg=DarkCyan ctermbg=Black
    hi Number       guifg=DarkCyan guibg=Black
    hi Folded       ctermfg=DarkCyan ctermbg=Black cterm=underline term=none
    hi Folded       guifg=DarkCyan guibg=Black gui=underline term=none
    hi Special      ctermfg=darkgreen      ctermbg=Black
    hi Special      guifg=darkgreen      guibg=Black
    hi PreProc      ctermfg=DarkGreen ctermbg=Black cterm=bold term=bold
    hi PreProc      guifg=DarkGreen guibg=Black gui=bold term=bold
    hi Scrollbar    ctermfg=DarkCyan      ctermbg=Black
    hi Scrollbar    guifg=DarkCyan      guibg=Black
    hi Cursor       ctermfg=Black     ctermbg=green
    hi Cursor       guifg=Black     guibg=green
    hi ErrorMsg     ctermfg=Red       ctermbg=Black cterm=bold term=bold
    hi ErrorMsg     guifg=Red       guibg=Black gui=bold term=bold
    hi WarningMsg   ctermfg=Yellow    ctermbg=Black
    hi WarningMsg   guifg=Yellow    guibg=Black
    hi VertSplit    ctermfg=black     ctermbg=Black
    hi VertSplit    guifg=black     guibg=Black
    hi Directory    ctermfg=Green      ctermbg=DarkBlue
    hi Directory    guifg=Green      guibg=DarkBlue
    hi Visual       ctermfg=White     ctermbg=DarkGray cterm=underline term=none
    hi Visual       guifg=White     guibg=DarkGray gui=underline term=none
    hi Title        ctermfg=White     ctermbg=DarkBlue
    hi Title        guifg=White     guibg=DarkBlue

    hi StatusLine   term=bold cterm=bold,underline ctermfg=White ctermbg=Black
    hi StatusLine   term=bold gui=bold,underline guifg=White guibg=Black
    hi StatusLineNC term=bold cterm=bold,underline ctermfg=Gray  ctermbg=Black
    hi StatusLineNC term=bold gui=bold,underline guifg=Gray  guibg=Black

    hi cursorline   ctermbg=darkgreen ctermfg=black
    hi cursorline   guibg=darkgreen guifg=black
endfunction

set fillchars+=vert:\ 
call VimRoom()
"call DarkRoom()
