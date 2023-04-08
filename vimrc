" DETAILS : My vim configuration file
" AUTHOR  : Ravikiran K.S., ravikirandotks@gmail.com
" CREATED : 23 Aug 2006 10:20:19
" MODIFIED: 08/04/2023 03:58:59 PM IST

" MOST IMP: Be frugal in adding to vimrc. To keep vim load times to moderate.
" :highlight- show different highlight settings
" :map      - show different key mapping
" :set      - show different config settings

filetype plugin on  " switch on plugins. filetype indent on -- no file based indent aut-selection
syntax on           " set syntax highlighting

" Functions ===============================================================
" Search first 10 lines for timestamp, update using TimeStamp() function
if !exists("*UpdateTimeStamp")
function! UpdateTimeStamp()
    " Do the updation only if the current buffer is modified
    if &modified == 1
        " Save current cursor position. Alternate: let save_cursor = getpos(".")
        let save_line = line(".")
        let save_column = col(".")
        " go to the first line
        exec "1"
        " <Last Modified String>
        if !exists('g:timeStampLeader')
            let s:timeStampLeader = 'MODIFIED: '
        else
            let s:timeStampLeader = g:timeStampLeader
        endif
        " Search for Last modified:
        let modified_line_no = search(s:timeStampLeader)
        " There is a match in first 10 lines Go to the : in modified:
        if modified_line_no != 0 && modified_line_no < 8
            " Timestamp format: strftime("%d %b %Y %X")
            "exe 's/'.s:timeStampLeader.'.*/'.s:timeStampLeader.strftime("%d %m %y %X %Z")
            let tstamp = strftime('%d').'\/'.strftime('%m').'\/'.strftime('%Y').strftime(' %r')
            exe 's/'.s:timeStampLeader.'.*/'.s:timeStampLeader.tstamp
        endif
        " Restore cursor position. Alternate - call setpos('.' , save_cursor)
        call cursor(save_line, save_column)
    endif
endfunction
endif

" lighgrey is choice of color by default. ctermbg=240 for zenburn
" For subsequent matches, replace 2match with subsequent number.
"if !exists("*HandleMyBufEnter")
"function! HandleMyBufEnter()
"endfunction
"endif

" Now session stored per directory
if !exists("*SaveMySession")
function! SaveMySession()
    " Store file names, position, and other info
    execute 'mksession! ' . getcwd() . '/.session.vim'
    " Store vim buffers and editing info
    execute 'wviminfo! ' . getcwd() . '/.viminfo.vim'
endfunction
endif

" Check on each VimEnter for no arguments and session files is time consuming - argc() == 0 && 
" So, do not do this autocmd. Instead mapped to F-keys autocmd VimEnter * call RestoreMySession()
if !exists("*RestoreMySession")
function! RestoreMySession()
    " If .session.vim, .viminfo.vim are present in current directory, read
    if filereadable(getcwd() . '/.session.vim') && filereadable(getcwd() . '/.viminfo.vim')
        execute 'source ' . getcwd() . '/.session.vim'
        execute 'rviminfo ' . getcwd() . '/.viminfo.vim'
    endif
endfunction
endif

" Automatically give exec permission if file begins with #! and contains '/bin/' in the path
if !exists("*MakeScriptExecuteable")
function! MakeScriptExecuteable()
    if getline(1) =~ "^#!.*/bin/"
        silent !chmod +x <afile>
    endif
endfunction
endif

" Autoload cscope database somewhere up in the directory tree.
if !exists("*LoadCscope")
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
endif

" Load external vimrc if present
if !exists("*LoadExtVimrc")
function! LoadExtVimrc()
    if filereadable(glob("~/.vimrc.ext"))
        source ~/.vimrc.ext
        "let s:tmp_path = escape( expand( '<sfile>:p:h' ), '\' )
        "echo 'tmp_path: ' s:tmp_path
    endif
    if filereadable(getcwd() . '/.vimrc.local')
        execute 'source ' . getcwd() . '/.vimrc.local'
    endif
endfunction
endif

" Toggles between horizontal and vertical splits
if !exists("*ToggleWindowSplit")
function! ToggleWindowSplit()
  if !exists('t:splitType')
    let t:splitType = 'horizontal'
  endif

  if t:splitType == 'vertical' " is vertical switch to horizontal
    windo wincmd K
    let t:splitType = 'horizontal'

  else " is horizontal switch to vertical
    windo wincmd H
    let t:splitType = 'vertical'
  endif
endfunction
endif

if !exists("*HTMLSettings")
function! HTMLSettings()
    set tabstop=2 softtabstop=2 shiftwidth=2
endfunction
endif

if !exists("*MarkdownSettings")
function! MarkdownSettings()
    set textwidth=160 wrapmargin=0 linebreak syntax=markdown
endfunction
endif

if !exists("*CSettings")
function! CSettings()
    set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=81 wrapmargin=0
endfunction
endif

" Now session stored per directory
if !exists("*PythonSettings")
function! PythonSettings()
    " Store file names, position, and other info
    setfiletype python
    set encoding=utf-8 foldmethod=indent autoindent nofoldenable
    set tabstop=2 softtabstop=2 shiftwidth=2
endfunction
endif
" Functions ===============================================================

" Common command mistakes =================================================
command WQ wq
command Wq wq
command W w
command Q q                 " OR nnoremap Q gq
command Qa qa
command WN w|n              " ca wn w|n <- doesnt work. wn is valid vim command
command! CD cd %:p:h        " switch to directory of current file
command Dos2unix %s//\r/g " Replace (Ctrl-V) Ctrl-M with newline. Useful in script log (typescript).
" Common command mistakes =================================================

" Settings ================================================================
set nocompatible                    " set no compatible mode
set cscopetag                       " use cscope tag instead of default tag
if (&diff == 0)
    set number                      " display linenumbers in text
endif
set ruler                           " show column, row count
set showcmd                         " show key sequence in status line
set showmode                        " show mode we are working on
set ttyfast                         " we have a fast terminal
set ttybuiltin                      " (default) use internal termcap
set restorescreen                   " restore screen contents when exiting vim
set startofline                     " place cursor on non-white char of line
"set undofile                        " place .<filename>.un~ file in file dir

set noautoindent                    " set automatic indenting - deprecated in favor of smartindent
set nocindent                       " no cindent initially - later enabled for C files
set autoread                        " watch for file changes
set hidden                          " Allows new file to be opened without writing into current file. Later save.
set expandtab                       " replace tabs with spaces.
set noerrorbells                    " Quiet mode
"set wrap                            " Auto-Wrap overflowing text visually without inserting line breaks
set linebreak                       " wrap line at words-breakers; defined by 'breakat'
set nolist                          " disables linebreak; only visual changes, not to buffer
set shiftround                      " Round indent to multiples of shiftwidth
"set nostartofline                   " Set to keep cursor at same horizontal location during scrolling

"set ignorecase                      " makes searches case insensitive...
set showmatch                       " show matching brackets/braces/parantheses.
set hlsearch                        " highlight matches
set incsearch                       " show matches as regular expression typed
set wrapscan                        " do search/scan cyclically

set nosmartindent                     " smart indent the files - disable for C in favor of cindent
set nosmartcase                       " ...if it didn't begin with a capital letter

set tabstop=4                       " number of spaces for a <TAB>
set softtabstop=4                   " how many spaces that vim uses when you hit <TAB>
set shiftwidth=4                    " number of spaces to shift on >>, <<
set nosmarttab
set wrapmargin=0                    " disable auto-wrap magin
" Vim ver 7.3+ has both colorcolumn (alternate, if exists('+syntax')) and numberwidth (alt, if exists('+linebreak'))
if v:version >= 703
  set colorcolumn=+0                " highlight column after 'textwidth'
  set numberwidth=4                 " width of number column
else
  highlight OverLength ctermbg=lightgray guibg=lightgray
  " vim7.2 onwards use colorcolumn
  match OverLength /\%81v.\+/
endif

set textwidth=80                    " Wrap after text-width
set winminheight=0                  " Allow windows to get fully squashed
set cmdheight=1                     " number of lines left on bottom for command

set backspace=2                     " backspace works as in MS Windows. Same as 'indent,eol,start'
set laststatus=2                    " Always display a status line at the bottom of the window

set undolevels=50                   " number of undo's supported
set history=50                      " number of commands to keep
set mat=2                           " 200ms gap before highlight matching brackets
"set verbose=20                     " See everything vim is doing. 9 gives some insight

set foldenable                      " enable folding in vim
set foldlevel=1                     " Any fold with more than 2 levels will be folded
set foldmethod=syntax               " fold based on indentation. ex, manual

set cpoptions+=n                    " show "showbreak" characters in line-number area
set showbreak=->\                   " characters to show on visual-only line-break
set shortmess=aoI                   " Set vim to use abbrevations in place of 'long messages'. t - truncates
set cinoptions=(0                   " C indent func args. Default: cinoptions='0{,0},0),:,0#,!^F,o,O,e'
set cinoptions+=:0                  " C indent switch-case statements
set background=dark                 " set background to dark/light. colorscheme may override this
set visualbell t_vb=                " silence the bell, use a flash instead
set virtualedit=block               " cursor goes anywhere only in Visual mode
set iskeyword+=_,@,#,?,%            " these should be treated as part of word.
set diffopt=filler,iwhite,context:3 " ignore white, also show 3 context lines
set formatoptions=tcroql            " for wrap to work
set sessionoptions+=unix,slash      " Store session info in Unix format.
set comments=sl:/*,mb:*,elx:*/      " comment format
set rulerformat=%15(%c%V\ %p%%%)    " how to display ruler
set viminfo='5,\"10,:20,%,n~/.viminfo      " remember last read line. Where-
"'5 = Remember marks for last 5 files. \"10 = Remember 50 lines each from registers
":20 = Number of cmd-line history saved. "~/_viminfo = Name of file to use.
set wildmenu                        " better command-line completion
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif " don't suggest obj files
set fileformat=unix                 " unix file format
"set undodir=~/.vim/undodir          " place all undo .<file>.un~ files in this dir. Does not work for multi-projects

set statusline=                         " clear statusline when vimrc is reloaded
set statusline=[%02n]\                  " bufnum
set statusline+=%<                      " cut at start
set statusline+=%-60F\                  " full filepath. max 40 chars.
set statusline+=[%H                     " help file flag
set statusline+=%M                      " modified flag
set statusline+=%R                      " read-only flag
set statusline+=%W]                     " write flag
set statusline+=%y\                     " filetype
set statusline+=(%{&ff})\               " file format
"set statusline+={%{synIDattr(synID(line('.'),col('.'),1),'name')}}  " show highlight group for current word
set statusline+=%=\                     " left-right seperator
set statusline+=row:%l/%L\              " row and total num of lines
set statusline+=col:%03c%2V\ (%03p%%)\  " column, offset and percentage through file

set makeprg=gmake       " make utility name & compiler options. ex, makeprg=make\ \CC=gcc
set tags=$PWD/tags;/    " Tags location, semicolon separated. Juniper: /volume/build/junos/head/daily/current/TAGS
"set csprg=/bin/cscope  " set cscope path. We don't need it.

set clipboard=exclude:.*                " important for fast vim loading. disables vim querying X server for clipboard
" Settings ================================================================

" Author (Now defined from within Templates) ==============================
let g:author_short ="Ravikiran K.S."                        " author name
let g:author       ="ravikirandotks@gmail.com"              " author email id
let g:company      ="Trivial Conversations"                 " company name
" Author ==================================================================

" Mappings ================================================================
" Treat long lines (unwrapped ones) as break lines
map j gj
map k gk
" Switch between windows easily. Ctrl-j forward switch (Alternate, <C-W><C-W>)
map <C-j> <C-W>w
"map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
" Select all.
map <c-a> ggVG

" Disable ctr-c, ctrl-s, and ctrl-x
"map <C-C> <C-W>c
map <C-C> <nop>
" Ctrl-S saves last session. This does not work
"map <C-S> :call SaveMySession()<CR>:wqa!<CR>
map <C-S> <nop>
" Quit, But not when there are changes
"map <C-X> :qa<CR>
map <C-X> <nop>

" One less keystroke each time. But don't know if I can adjust to it.
nnoremap ; :
vnoremap ; :
" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

map <Home> ^

" Undo in insert mode.
imap <c-z> <c-o>u
nnoremap <silent> <F2> :call ToggleWindowSplit()<cr>
nnoremap <silent> <F3> :set ic!<cr>
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/\n\{3,}/\r\r/e<Bar>:let @/=_s<Bar>:nohl<Bar> :retab<CR>
nnoremap <silent> <F5> :if exists("syntax_on") <Bar>syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
nnoremap <silent> <F6> :set nu!<cr>
nnoremap <silent> <F7> :VCSVimDiff<cr>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :call RestoreMySession()<CR>
nnoremap <silent> <F10> :set hlsearch!<cr>
nnoremap <silent> <F11> :Vexplore!<CR>
nnoremap <silent> <F12> :call BufferList()<CR>
" Mappings ================================================================

let g:skip_defaults_vim = 1
" Colorschme ==============================================================
" maintaining local terminal info data base as ~/.terminfo. commands are:
" infocmp -L -1 xterm | sed -r 's/(max_colors)#.+/\1#256/' > /tmp/xterm
" tic /tmp/xterm
"if exists('$TMUX')
    let &t_Co=256       " 256 color -- set t_Co=256
    if &term =~ "xterm"
        " restore screen after quitting. doesn't work
        "set t_ti=7[r[?47h t_te=[?47l8
        if has("terminfo")
            " To get  press Ctrl-V <Esc>
            set t_Sf=[3%p1%dm        "set t_AB=[48;5;%dm
            set t_Sb=[4%p1%dm        "set t_AF=[38;5;%dm
        else
            set t_Sf=[3%dm    "set t_AB=[48;5;%dm
            set t_Sb=[4%dm    "set t_AF=[38;5;%dm
        endif
    endif
"endif

" Highlight custom data type defines
syn keyword ncType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t boolean u_int64_t u_int32_t u_int16_t u_int8_t u_int_t
syn keyword ncOperator likely unlikely
highlight def link ncType Type
highlight def link ncOperator Operator

" Highlight Function names.
syn match cCustomParen "?=(" contains=cParen contains=cCppParen
syn match cCustomFunc  "\w\+\s*(\@=" contains=cCustomParen
highlight def link cCustomFunc Function

" Put color scheme before other color overrides. Colorscheme depends on term settings.
"let g:solarized_termcolors=256
colorscheme flattened_dark  "solarized PaperColor tango default peaksea lucius peachpuff louver inkpot trivial256 hemisu rkks-linux zenburn habiLight ir_black oceandeep
" Colorschme ==============================================================

" Plugin Configs ==========================================================
let c_space_errors = 1
let c_no_tab_space_error = 1
let html_use_css = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 40

" highlight strings inside C comments
let c_comment_strings=1

let g:explSplitRight=1
let g:explStartRight=1

let g:BufferListWidth = 25
let g:BufferListMaxWidth = 50

let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let g:closetag_emptyTags_caseSensitive = 1
" Plugin Configs ==========================================================

let g:skip_defaults_vim = 1
" Autocommands ============================================================
" To disable autocommands during vim start, use 'set eventignore=all'
if !exists("autocommands_loaded")
    autocmd BufEnter /* call LoadCscope()
    autocmd BufEnter * call LoadExtVimrc()

    autocmd BufEnter,BufNewFile,BufRead,BufLeave * colorscheme solarized
    autocmd BufEnter *.log colorscheme default
    autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cxx,*.hxx,*.cc colorscheme default

    autocmd BufNewFile,BufRead wscript,meson.build,*.py,*.pyw call PythonSettings()
    autocmd BufRead *.c,*.h,*.cpp,*.hpp,*.cxx,*.hxx,*.cc call CSettings()
    autocmd BufNewFile,BufRead *.md,*.txt call MarkdownSettings()
    autocmd BufNewFile,BufRead *.html,*.htm,*.js,*.css call HTMLSettings()
    autocmd BufNewFile,BufRead *.proto setfiletype proto
    autocmd BufNewFile,BufRead *.yang setfiletype yang
    autocmd FileType gitcommit set textwidth=72
    autocmd FileType yaml setlocal ts=2 sw=2

    " update MODIFIED time stamp on write. Automatically restores the cursor position internally.
    autocmd BufWritePre,FileWritePre * call UpdateTimeStamp()
    autocmd BufWritePost,FileWritePost * call MakeScriptExecuteable()

    " remember last read line
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Highlight extra whitespace - *.[ch] Or *.[cpp|pl|pm|sh|py|exp|mk|xml] does not work
    "Other regex: /^\s* \s*\|\s\+$/
    autocmd BufEnter * match RedundantSpaces /\s\+$\| \+\ze\t\|\t/ 

    let autocommands_loaded = 1
endif
" Autocommands ============================================================

" Hardcoded Color Overrides ===============================================
highlight RedundantSpaces ctermbg=lightgray guibg=lightgray
highlight ColorColumn ctermbg=lightgray guibg=lightgray
" Hardcoded Color Overrides ===============================================
