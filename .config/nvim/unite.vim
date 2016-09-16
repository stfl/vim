" Unite config
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

if has('nvim')
   " nnoremap <C-p> :Unite file_rec/neovim <cr>
else
   " nnoremap <C-p> :Unite file_rec/async <cr>
endif

" yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" like ack / ag
nnoremap <space>/ :Unite grep:.<cr>

" switching buffers
nnoremap <space>s :Unite -quick-match buffer<cr>

" MRU
nnoremap <space>p :Unite file_mru<cr>
