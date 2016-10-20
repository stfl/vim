" -----------
" Unite config
" -----------

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

if has('nvim')
   " nnoremap <C-p> :Unite file_rec/neovim <cr>
else
   " nnoremap <C-p> :Unite file_rec/async <cr>
endif

" yank history
nnoremap <leader>y :Unite history/yank -default-action=append<cr>

" like ack / ag
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>s :Unite -quick-match tab<cr>
nnoremap <leader>S :Unite -quick-match buffer<cr>
nnoremap <leader>p :Unite file_mru<cr>
nnoremap <leader>um :Unite mapping<cr>
