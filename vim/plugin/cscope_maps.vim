""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('csWinLoaded')
    finish
endif
let csWinLoaded=1

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags
    " set to 1 if you want the reverse search order.
    set csto=0

    " Show complete path in cscope search output
    set cspc=0

    " add any cscope database in current directory
    "if filereadable("cscope.out")
    "    cs add cscope.out
    "endif
    " add the database pointed to by environment variable (if set)
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    " Use 'set nocsverb' to quiet cscope warnings
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).

    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "
    " To navigate through the cscope tags hit 'CTRL-\', followed by one of the
    " cscope search types
    " s - symbol, g - global definition, d - called funcs, c - calling funcs,
    " t - text search, e - egrep, f - find file, i - files including this file)
    nmap <C-\>s :csc find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :csc find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :csc find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :csc find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :csc find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :csc find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :csc find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :csc find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>a :csc add cscope.out<CR>
    nmap <C-\>h :csc help<CR>
    nmap <C-\>k :csc kill 0<CR>
    nmap <C-\>w :csc show<CR>
    nmap <C-\>r :csc reset<CR>

    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-\>ss :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>gg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>cc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>tt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>ee :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>ff :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>ii :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>dd :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    set ttimeoutlen=100

endif

