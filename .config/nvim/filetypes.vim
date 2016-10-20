" -----------
"  Plugin independet **filetype** settings
" -----------

augroup MyAutoCmd " {{{

   " enable spelling in markdown and latex
   autocmd FileType latex setlocal spell textwidth=100 colorcolumn=100
   autocmd BufRead *.tex setlocal spell textwidth=100 colorcolumn=100

   autocmd BufRead *.pdc setlocal filetype=pandoc

   autocmd FileType markdown,latex call MatchTechWordsToAvoid()
   autocmd BufWinEnter *.md,*.tex call MatchTechWordsToAvoid()
   autocmd InsertEnter *.md,*.tex call MatchTechWordsToAvoid()
   autocmd InsertLeave *.md,*.tex call MatchTechWordsToAvoid()
   autocmd BufWinLeave *.md,*.tex call clearmatches()
augroup END

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
   match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/

endfunction

" }}}

au MyAutoCmd FileType python nnoremap <F9> :exec '!python3' shellescape(@%, 1)<cr>


