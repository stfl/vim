function! CopyMatches(reg) " {{{
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" }}}
" Highlight words to avoid in tech writing {{{
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
   match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
augroup tech_words
   autocmd!
   autocmd FileType markdown,latex call MatchTechWordsToAvoid()
   autocmd BufWinEnter *.md,*.tex call MatchTechWordsToAvoid()
   autocmd InsertEnter *.md,*.tex call MatchTechWordsToAvoid()
   autocmd InsertLeave *.md,*.tex call MatchTechWordsToAvoid()
   autocmd BufWinLeave *.md,*.tex call clearmatches()
augroup END

" }}}
"
" Makes * and # work on visual mode too.
" See: http://github.com/nelstrom/vim-visual-star-search
function! VSetSearch(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}

" Zoom / Restore window {{{
command! ZoomToggle call s:ZoomToggle()
function! s:ZoomToggle() "{{{
	if exists('t:zoomed') && t:zoomed > -1
		execute t:zoom_winrestcmd
		let t:zoomed = -1
	else
		let t:zoom_winrestcmd = winrestcmd()
		resize
		vertical resize
		let t:zoomed = bufnr('%')
	endif
endfunction

" }}}

