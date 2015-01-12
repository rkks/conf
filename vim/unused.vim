" Follow linus coding style
filetype on
filetype plugin on  " switch on plugins on start
filetype indent on  " switch on plugins on start

" Functions ===============================================================
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:  ' . a:cmdline)
    call setline(2, 'Expanded to:  ' . expanded_cmdline)
    call append(line('$'), substitute(getline(2), '.', '=', 'g'))
    silent execute '$read !'. expanded_cmdline
    1
endfunction

function! ModifyTime()
    "Do the updation only if the current buffer is modified
    if &modified == 1
        let current_time = strftime("%b %d %Y %X") " CHANGE this!
        " Save current position at mark i
        normal mi
        " Search for Last modified:
        let modified_line_no = search("Last modified:")
        if modified_line_no != 0 && modified_line_no < 10
        " There is a match in first 10 lines
        " Go to the : in modified: and replace the timestamp.
            exe "normal f:2l" .strlen(current_time) . "s" . current_time
            echo "Modified datestamp to " . current_time
            sleep 500m
            " Restore position
            normal `i
        endif
    endif
endfunction

function! InsertFname()
  " Convert newname.h to _NEWNAME_H_
  let fname = expand("%")
  let lastslash = strridx(fname, "/")
  if lastslash >= 0
  let fname = strpart(fname, lastslash+1)
  endif
  let fname = substitute(fname, "[^a-zA-Z0-9]", "_", "g")
  let fname = toupper(fname)
  exec 'norm O#ifndef ' . fname
  exec 'norm o#define ' . fname
  let origin = getpos('.')
  exec '$norm o#endif'
  norm o
  -norm O
  call setpos('.', origin)
  norm w
endfunction
" Functions ===============================================================

" Autocommands ============================================================
"autocmd for .h files
if !exists("autocommands_loaded")
    au BufNewFile *.h call InsertFname()
    let autocommands_loaded = 1
    au BufWrite *.h call ModifyTime()
endif

autocmd BufRead *.c/*.h/*.x set cindent                     " for files ending with c,h,x use C indenting

au FocusLost silent! :wa

" remember last read line
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"au BufRead,BufNewFile *.[ch] set tw=0
au BufRead,BufNewFile Makefile set tw=0
au BufRead,BufNewFile Makefile set noexpandtab

autocmd BufWinEnter * match RedundantSpaces /\s\+$\| \+\ze\t/
" Appears multiple file open, close within single vim session leads to memleak
" because of redundant spaces. So, clean it up.
autocmd BufWinLeave * call clearmatches()

" Keep Jay and Greg happy
":let w:m1=matchadd('Search', '\%<81v.\%>79v', -1)
":let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
":au BufWinEnter *.[ch] let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
":au BufWinEnter *.[ch] let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" Autocommands ============================================================

" Settings ================================================================
syntax on                                                   " set syntax highlighting
set viminfo='10,\"100,:20,%,n~/.viminfo                     " remember last read line
set isk+=_,$,@,%,#,-,?,%,& " none of these should be word dividers, so make them not be
set shortmess=at
set nocp                                                    " set no compatible mode
set diffopt+=filler,iwhite
set tabstop=4                                           " number of spaces for a <TAB>
set softtabstop=4
set nosmarttab
set shiftwidth=4                                        " number of spaces to shift on >>, <<
set expandtab
set textwidth=78                                            " maximum length of any line
set undolevels=200
set autoindent                                              " set automatic indenting
set cindent                                                 " indent files in C format
set number                                                  " display linenumbers in text
set ignorecase                                              " makes searches case insensitive...
set smartcase                                               " ...if it didn't begin with a capital letter
set showmatch                                               " show matching brackets/braces/parantheses.
set visualbell t_vb=                                        " silence the bell, use a flash instead
set background=dark                                         " set background to dark
set ch=2                                                    " number of lines left on bottom for command
set hlsearch                                                " highlight matches
set ruler                                                   " show column, row count
set rulerformat=%15(%c%V\ %p%%%)
set showcmd                                                 " show key sequence in status line
set incsearch                                               " show matches as regular expression typed
set history=1000                                            " number of commands to keep
set wildmenu                                                " present a menu for file completion
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif " don't suggest object files
set cmdheight=2
set showmode                                                " show mode we are working on
set comments=sl:/*,mb:*,elx:*/                              " comment format
set backspace=2                                             " Enable backspace to work as in MS windows
set csprg=/usr/bin/cscope                                   " set cscope
set noerrorbells
set winminheight=0                                          " Allow windows to get fully squashed
set tags=tags;/                                             " Easy Tags plugin configuration
set virtualedit=block                                       " cursor goes anywhere only in Visual mode
"set makeprg=make\ \CC=gcc                                  " set the make utility and compiler options for vim
"set guifont=consolas
"set guifont=consolas:h10
"set foldenable                                             " enable folding in vim
"set foldmethod=manual                                      " fold based on indentation
"set foldlevel=1                                                " Any fold with more than 2 levels will be folded
"set backspace=indent,eol,start                     " what a backspace can plow through
"set diffopt=filler,iwhite,context:3                        " ignore white, also show 3 context lines
"set t_Co=256
"set mouse=a                                                    " enable mouse in screen (probably by term type in future)
"set ttymouse=xterm2                                        " behave xterm
"set guifont=9x15                                           " font size
"set cursorline                                             " show cursor line num
"set cursorcolumn                                           " show cursor column num
"set wrapwidth=80                                           " set wrapwidth=80 doesn't work now
"set linebreak                                              " wrap at words; only changes look not buffer
"set wrap                                                   " wrap overflowing text; only changes look not buffer
"set wh=20                                                  " Set default window height
"set wmh=10                                                 " Set window minimum height
"set smartindent                                            " smart indent the files
"set indentexpr                                             " indent the expressions
"set completeopt=longest,menuone                        " Change menu style for vim
"set tabpagemax=15
"set showtabline=2
" Settings ================================================================

" Mappings ================================================================
" Switch between windows, maximizing the current window
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

map <B-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <B-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

"type \H to underline a line.
nnoremap <Leader>H yyp^v$r-o<Esc>

inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

nnoremap <silent> <F2> :set ai!<cr>
map <F2> :retab <CR> :w! <CR>
nnoremap <silent> <F3> :set ic!<cr>
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/\n\{3,}/\r\r/e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <F5> :if exists("syntax_on") <Bar>syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
nnoremap <silent> <F6> :set nu!<cr>
"press F7 in vim, show diff to cvs last version, vertical split
map <F7> <Plug>Cvsdiffv
"nnoremap <silent> <F7> :shell<cr>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :set hlsearch!<cr>
nnoremap <silent> <F10> :TOhtml<cr>
" Press F11 to start scrolling, and Crtl-C to stop
map <F11> <C-E>:sleep 1000m<CR>j<F11>

imap <C-t> <Esc>:tabnew<CR>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
"nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
nnoremap <silent> <C-s> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

"noremap ? :diffupdate<cr>                  "Update the diff window and highlight diff
"noremap < do                                   "diff obtain
"noremap > dp                                   "diff put
"noremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Mappings ================================================================

" Highlights ==============================================================
" Highlight redundant whitespaces.
highlight RedundantSpaces ctermbg=white
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
"autocmd BufWinEnter * match RedundantSpaces /^\s* \s*\|\s\+$/

" vimdiff related changes
"highlight DiffAdd cterm=none ctermbg=cyan gui=none
"highlight DiffDelete cterm=none ctermbg=cyan gui=none
"highlight DiffChange cterm=none ctermbg=Red gui=none
"highlight DiffText cterm=none ctermbg=Green gui=none

"hi NonText         cterm=NONE ctermfg=0
"hi StatusLine      cterm=NONE           ctermbg=6
"hi FillColumn      cterm=NONE           ctermbg=4 ctermfg=4
"hi StatusLineNC    cterm=NONE           ctermbg=4
"hi Cursor          cterm=bold ctermfg=7
"hi ModeMsg         cterm=bold ctermfg=6
"hi Visual          cterm=NONE           ctermbg=0
"hi LineNr          cterm=NONE ctermfg=4
"hi Search          cterm=NONE ctermfg=0 ctermbg=3
"hi IncSearch       cterm=NONE ctermfg=1 ctermbg=3
" Highlights ==============================================================

" Plugin Configs ==========================================================
"let g:easytags_dynamic_files = 1
" This should always point to Exuberant Ctags binary
"let g:easytags_cmd = '/usr/bin/ctags'
"let b:easytags_auto_highlight

let c_space_errors = 1
let c_no_tab_space_error = 1
let html_use_css = 1
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

" Author information
let g:author_short="Ravikiran K.S."                             " author name
let g:author      ="mr.rkks@gmail.com"                          " author email id
let g:company     ="Stoke Networks"                             " company name
" Plugin Configs ==========================================================

" Abbrevations ============================================================
" Randolph Chung shortcuts
cnoreabbrev mkppc make qnx-ppc JOBS=32
cnoreabbrev mkarm make qnx-arm JOBS=32
cnoreabbrev mkcb make cb JOBS=32
cnoreabbrev mkcbqnx make cbqnx JOBS=32
cnoreabbrev mkifs make cb-imc-bin-ifs
cnoreabbrev mknonfs make cbimcifs-nonfs
cnoreabbrev mkclean make realclean
cnoreabbrev mkcleanppc make qnx-ppc-clean
cnoreabbrev mkcleanarm make qnx-arm-clean
" Abbrevations ============================================================

" Colors ==================================================================
"colors zenburn
"colors slate
"colors evening
"colors desert
"colors inkpot
"colors wombat
"colors peaksea
" Colors ==================================================================

" -----------------------------------------------------------
"  " Optional extended-configuration files
"
"  " Source developer vim settings (overriding defaultts)
"  if filereadable(expand("$HOME/.vim_dev.rc"))
"   source ~/.vim_dev.rc
"   endif

" Unused ==================================================================

" Unused Autocommands =====================================================
" Seems multiple file open/close within single vim session leads to memleak
" because of redundant spaces. So, clean it up. Func doesnt exist below Vim 7.2
autocmd BufWinLeave * call clearmatches()

autocmd VimLeave * call SaveMySession()
" This is very important. Need to see if this resets all colors.
autocmd VimLeave * call system("echo -e '\E[m'")

autocmd! BufWinEnter *.[chxsS] call HandleMyBufEnter()

" Enter diff mode using vim -d
if &diff
    call SetupDiffMappings()
endif
" Entering diff mode from within vim - diffsplit, etc.
autocmd FilterWritePost * call SetupDiffMappings()
" Unused Autocommands =====================================================

" Unused Color Options ====================================================
" vimdiff related changes
highlight DiffAdd cterm=none ctermbg=cyan gui=none
highlight DiffDelete cterm=none ctermbg=cyan gui=none
highlight DiffChange cterm=none ctermbg=Red gui=none
highlight DiffText cterm=none ctermbg=Green gui=none

hi NonText         cterm=NONE ctermfg=0
hi StatusLine      cterm=NONE           ctermbg=6
hi FillColumn      cterm=NONE           ctermbg=4 ctermfg=4
hi StatusLineNC    cterm=NONE           ctermbg=4
hi Cursor          cterm=bold ctermfg=7
hi ModeMsg         cterm=bold ctermfg=6
hi Visual          cterm=NONE           ctermbg=0
hi LineNr          cterm=NONE ctermfg=4
hi Search          cterm=NONE ctermfg=0 ctermbg=3
hi IncSearch       cterm=NONE ctermfg=1 ctermbg=3

if has("terminfo")
    let &t_Co=16
    let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
    let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
endif
" Unused Color Options ====================================================

" Unused Mappings =========================================================
nnoremap <silent> <F10> :TOhtml<cr>

map <C-Up> :set<CR>
map <C-Down> :map<CR>

"press F9 in vim, show diff to cvs last version, vertical split
map <F9> <Plug>Cvsdiffv
"Rexplore command doesnt exist prior to Vim 7.2
map <F12> :Rexplore<CR>

" Simulate Ctrl+Shft+t feature in browsers. i.e. reopen last closed tab. Ctrl-t
" cant be overridden, it is used by Ctags and Cscope. Ctrl-Shft-t overriding
" also gives similar problems.
nmap <c-s-t> :sp<bar>:b#<CR>

" Excellent one. Avoid pressing Shft for every control command. Bad one, doesn't work with traditional vi
nnoremap ; :

nnoremap <silent> <F7> :shell<cr>
" '\a' : grep all args list
noremap a :argdo
" '\b' : grep all open buffers
noremap b :bufdo
" '\t' : grep all open tabs
noremap t :tabdo
" '\h' : grep all open windows
noremap h :windo
" '\q' : toggle QuickFix window (errors and vimgrep results here)
noremap q :call QFixToggle(0)
" '[q' previous quickfix entry
map [q :cprev<CR>
" ']q' next quickfix entry
map ]q :cnext<CR>
nnoremap <Leader>w :let @/=expand("<cword>")<Bar>split<Bar>normal n<CR>
noremap <expr> <CR> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'

"type \H to underline a line.
nnoremap <Leader>H yyp^v$r-o<Esc>

" If the current buffer has never been saved, it will have no name, call the file browser to save it, otherwise just save it.
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
nnoremap <silent> <C-s> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
" Unused Mappings =========================================================

" Unused Settings =========================================================
set noguipty
set wildmenu                                " present a menu for file completion
set list
set listchars=tab:>.
set indentexpr                              " indent the expressions
set completeopt=longest,menuone         " Change menu style for vim
set tabpagemax=15
set showtabline=2
set modelines=0
" Unused Settings =========================================================

" Unused Functions ========================================================
if !exists("*ToggleWindowFocus")
function ToggleWindowFocus(act)
  if a:act < 0 || a:act > 2 | return | endif
  let posX = getwinposx()
  let posY = getwinposy()
  let actTab = "XXX__X_XR__XX_X__RRRR__R"
  let idx = ((exists("g:twsWM") + exists("g:twsHM") * 2) * 3 + a:act) * 2
  let actW = strpart(actTab, idx, 1)
  let actH = strpart(actTab, idx + 1, 1)
  " note. g:tws + [Width,Height,X,Y] + [Maximized,Saved]
  if actW == "X"
    let g:twsWS = &columns | let g:twsXS = posX
    set columns=999
    let posX = getwinposx()
    let g:twsWM = &columns | let g:twsXM = posX
  elseif actW == "R"
    if g:twsWM == &columns
      let &columns = g:twsWS
      if g:twsXM == posX | let posX = g:twsXS | endif
    endif
    unlet g:twsWM g:twsWS g:twsXM g:twsXS
  endif
  if actH == "X"
    let g:twsHS = &lines | let g:twsYS = posY
    set lines=999
    let posY = getwinposy()
    let g:twsHM = &lines | let g:twsYM = posY
  elseif actH == "R"
    if g:twsHM == &lines
      let &lines = g:twsHS
      if g:twsYM == posY | let posY = g:twsYS | endif
    endif
    unlet g:twsHM g:twsHS g:twsYM g:twsYS
  endif
  execute "winpos " . posX . " " . posY
endfunction
endif

if !exists("*SetupDiffMappings")
function! SetupDiffMappings()
    if &diff
        noremap ? :diffupdate<cr>               "Update the diff window and highlight diff
        noremap < do                            "diff obtain
        noremap > dp                            "diff put
    endif
endfunction
endif

function! InsertFname()
  " Convert newname.h to _NEWNAME_H_
  let fname = expand("%")
  let lastslash = strridx(fname, "/")
  if lastslash >= 0
  let fname = strpart(fname, lastslash+1)
  endif
  let fname = substitute(fname, "[^a-zA-Z0-9]", "_", "g")
  let fname = toupper(fname)
  exec 'norm O#ifndef ' . fname
  exec 'norm o#define ' . fname
  let origin = getpos('.')
  exec '$norm o#endif'
  norm o
  -norm O
  call setpos('.', origin)
  norm w
endfunction

"autocmd for .h files -- Not required as c-support does this already
"au BufNewFile *.h call InsertFname()

" Very time consuming during load
"    autocmd BufNewFile,BufRead *.dd setfiletype c           " Juniper - DDL files should follow c plugins
"    autocmd BufNewFile,BufRead *.odl setfiletype c          " Juniper - ODL files should follow c plugins
"    autocmd BufNewFile,BufRead *.errmsg setfiletype c       " Juniper - errmsg files should follow c plugins
"    autocmd BufNewFile,BufRead *.notes setfiletype text     " Mark filetype for notes
"    autocmd! BufNewFile,BufReadPre,FileReadPre  *.[chx]     set nosmartindent cindent noexpandtab " Juniper options
"    autocmd! BufNewFile,BufReadPre,FileReadPre  ?akefile    set tw=0 noexpandtab    " Makefile rules
"    autocmd! BufNewFile,BufReadPre,FileReadPre  *.sh        so ~/.vim/bashset.vim
"    autocmd! BufNewFile,BufReadPre,FileReadPre  *.txt       colors vimroom.vim


" Unused Functions ========================================================

" Unused ==================================================================
" Used to track the quickfix window.
"augroup QFixToggle
"    autocmd!
"    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
"    autocmd BufWinLeave * if exists("g:qfix_win") && expand("") == g:qfix_win | unlet! g:qfix_win | endif
"augroup END
"
"function! QFixToggle(forced)
"    if exists("g:qfix_win") && a:forced == 0
"        cclose
"    else
"        execute "copen"
"    endif
"endfunction


" Abbrevations ============================================================
"cnoreabbrev mkjinstall Shell mk jinstall -j 8
"ca WQ wq                   "Even command aliases would do.
" Abbrevations ============================================================

"set cursorline                             " show cursor line num
"set cursorcolumn                           " show cursor column num
"set autowrite                              " write the file on any of next, make, first, prev commands
"set wrapwidth=80                           " set wrapwidth=80 doesn't work now
"set winheight=20                           " Set default window height. default is 1

"set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}\                    " encoding

"let g:is_posix = 1          "Don't highlight shell scripts in old bash way which very few use

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" bufferlist.vim plugin options
highlight BufferSelected term=reverse ctermfg=white ctermbg=grey cterm=bold
highlight BufferNormal term=NONE ctermfg=black ctermbg=white cterm=NONE

" Juniper Stuff. Rarely used. So, taking out.
" Commands have context help, but not abbrevations. Hence keeping as commands
command Mkjinstall make jinstall -j 8
command Mkjroute make jroute -j 8
command Mkjpfe make jpfe -j 8
command Mkjkernel make jkernel -j 8
command Mkjdocs make jdocs -j 8
command Mkbuild make build
command Mkclean make clean
command Mknoobjclean !mk-noobj clean
command Mkdestroy make destroy

"map <UP> gk
"map <DOWN> gj
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Not sure if 'cscope reset' works
nnoremap <silent> <F10> :cscope kill 0<cr>:cscope add cscope.out<cr>

" use w!! to save current file using 'sudo' permissions
cmap w!! w !sudo tee % >/dev/null

if !exists("*HandleMyBufLeave")
function! HandleMyBufLeave()
    highlight clear RedundantSpaces
endfunction
endif

"function! s:GotoWinline(w_l)
"  normal! H
"  while winline() < a:w_l
"    normal! j
"  endwhile
"  " todo: beware of cases where the window is too little
"endfunction

" Better ]c, [c jump -- really used or fake?
function! s:NextDiff()
  if ! &diffopt =~ 'filler' | return | endif

  let ignore_blanks = &diffopt =~ 'iwhite'

  " Assert: called just after a ]c or a [c
  " Forces the cursos to be synchronized in all synced windows
  " let diff_l = line()
  try 
    let foldenable = &foldenable
    set nofoldenable

    let w_l = winline() " problematic with enabled lines (from diff...)
    " echomsg w_l.'|'.line('.').'|'.getline('.')

    let lines = {}
    windo if &diff | call <sid>GotoWinline(w_l) | let lines[winnr()]={'text':getline('.'), 'number':line('.')} | endif
  finally
    let &foldenable = foldenable
  endtry

  " echomsg string(lines)
  if len(lines) < 2 | return | endif

  let indices = repeat([0], len(lines))
  let tLines = values(lines)
  let found = 0
  " infinite loop on two empty texts...
  while ! found
    let c = ''
    let next_idx = []
    let i = 0
    while i != len(indices)
      let crt_line = tLines[i].text
      let n = indices[i]
      if len(crt_line) == n
    let found = 1
    break
      endif

      let c2 = (len(crt_line) == n) ? 'EOL' : crt_line[n]
      if empty(c) 
    let c = c2
      endif

      " checks match
      let n += 1
      if c =~ '\s'
    if (c2 != c) && (ignore_blanks && c2 !~ '\s')
      let found = 1
      break
    else " advance
      while ignore_blanks && (n == len(crt_line) || crt_line[n] =~ '\s')
        let n += 1
      endwhile
    endif
      else
    if c2 != c
      let found = 1
      break
    endif
      endif
      let next_idx += [n]

      let i += 1
    endwhile
    if found | break | endif

    let indices = next_idx
  endwhile

  " now goto the right column
  let windows = keys(lines)
  " Assert len(windows) == len(indices)
  let w = 0
  while w != len(windows)
    " echomsg 'W#'.windows[w].' -> :'(tLines[w].number).'normal! '.(indices[w]+1).'|'
    exe windows[w].'wincmd w'
    silent! exe (tLines[w].number).'normal! 0'.(indices[w]).'l'
    let w += 1
  endwhile
  " echomsg string(indices)
endfunction


" Useful, but not used
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:  ' . a:cmdline)
    call setline(2, 'Expanded to:  ' . expanded_cmdline)
    call append(line('$'), substitute(getline(2), '.', '=', 'g'))
    silent execute '$read !'. expanded_cmdline
    1
endfunction

" Broken. Doesn't work.
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Press F11 to start scrolling, and Crtl-C to stop
"nnoremap <silent> <F11> <C-E>:sleep 1000m<CR>j<F11>


    " On loosing focus, write file. Can be dangerous.
    "au FocusLost silent! :wa

    " Clearing of matches on bufleave isn't required. It has two advantages:
    " 1) Don't need to find error on subsequent reloads of same buf
    " 2) Syntax highlighting doesn't get goofed up.
    "autocmd! BufLeave * call HandleMyBufLeave()

" Unused
" Ctrl-k backward switch (Alternately, <C-W>W). Shouldn't use. Standard use is
" to display keys.
"map <C-k> <C-W>k
"map <C-/> :call ToggleWindowFocus(2)<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Show highlighting words for current group. Ctrl+Shft+P
nmap <C-S-P> :call <SID>SynStack()<CR>

" Visual mode press of * or # searches for current visual selection Super useful!
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
"if has("gui")
"  " set the gui options to:
"  " g: grey inactive menu items
"  " m: display menu bar
"  " r: display scrollbar on right side of window
"  " b: display scrollbar at bottom of window
"  " t: enable tearoff menus on Win32
"  " T: enable toolbar on Win32
"  set go=gmr
"  set guifont=Courier       " Font options. Other variants: guifont=9x15, guifont=consolas:h10
"  " mouse setting
"  if has('gui_running')
"      if has("gui_gtk2")
"          set guifont=Inconsolata\ 12
"      elseif has("gui_win32")
"          set guifont=courier_new:h11:cANSI
"      endif
"      " enable use of mouse
"      set mouse=a                           " causes GNU screen to hang sometimes
"      set ttymouse=xterm2                   " behave xterm
"      set selectmode=mouse                  " select when using the mouse
"  endif
"endif

" Java specific stuff
"let java_highlight_all=1
"let java_highlight_debug=1
"let java_ignore_javadoc=1
"let java_highlight_functions=1
"let java_mark_braces_in_parens_as_errors=1
