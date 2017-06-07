" -----------
"  Plugin independant **filetype** settings
" -----------

augroup MyAutoCmd " Pandoc Markdown setup {{{
   " enable spelling in markdown and latex
   autocmd FileType latex setlocal spell textwidth=100 colorcolumn=100 formatoptions+=tlv
   autocmd BufRead *.tex setlocal spell textwidth=100 colorcolumn=100 formatoptions+=tlv

   autocmd BufRead *.pdc setlocal filetype=pandoc
   autocmd FileType pandoc setlocal spell textwidth=100 colorcolumn=100 formatoptions+=tlv

   autocmd FileType markdown,latex,pandoc call MatchTechWordsToAvoid()
   autocmd BufWinEnter *.md,*.tex call MatchTechWordsToAvoid()
   " autocmd InsertEnter *.md,*.tex call MatchTechWordsToAvoid()
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

au MyAutoCmd FileType c,cpp,objc,objcpp set foldmethod=syntax

au MyAutoCmd BufRead /home/slendl/.ssh/config.d/* set ft=sshconfig
au MyAutoCmd BufRead /home/slendl/.config/mr/* set ft=sh
