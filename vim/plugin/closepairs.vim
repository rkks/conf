"==============================================================================
" closepairs.vim - Auto closes pairs of characters
"==============================================================================
"
" Author:   NoWhereMan (Edoardo Vacchi) <uncommonnonsense at gmail dot com>
" Version:  0.1
" URL: 	    http://www.flatpress.org/ 
" License:  Public Domain
"==============================================================================

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap < <><left>
inoremap " ""<left>
inoremap ' ''<left>

" We don't want a shortcut to surround highlighted text with a symbol.
" This breaks many default behaviour in visual mode.
"vnoremap <leader>" "zdi"<c-r>z"
"vnoremap <leader>' "zdi'<c-r>z'
"vnoremap <leader>( "zdi(<c-r>z)
"vnoremap <leader>[ "zdi[<c-r>z]
"vnoremap <leader>{ "zdi{<c-r>z}
"vnoremap <leader>< "zdi<<c-r>z>

inoremap <expr> <bs> <SID>delpair()

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')
inoremap <expr> > <SID>escapepair('>')

inoremap <expr> " <SID>pairquotes('"')
"This breaks default behavior of '
inoremap <expr> ' <SID>pairquotes("'")


function! s:delpair()
	let l:lst = ['""',"''",'{}','[]','()','<>']
	"let l:lst = ['""','{}','[]','()','<>']
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-2 : l:col-1]
	if index(l:lst, l:chr) > -1
		return "\<bs>\<del>"
	else
		let l:chr = l:line[l:col-3:l:col-2]
		if (index(l:lst, l:chr)) > - 1
			return "\<bs>\<bs>"
		endif
		return "\<bs>"
endf

function! s:escapepair(right)
	let l:col = col('.')
	let l:chr = getline('.')[l:col-1]
	if a:right == l:chr 
		return "\<right>"
	else
		return a:right

endf

function! s:pairquotes(pair)
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-1]
	if a:pair == l:chr 
		return "\<right>"
	else
		return a:pair.a:pair."\<left>"

endf

