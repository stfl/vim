nnoremap <leader> :<C-U>LeaderGuide ' '<CR>
vnoremap <leader> :<C-U>LeaderGuideVisual ' '<CR>
nnoremap <localleader> :<C-U>LeaderGuide ','<CR>
vnoremap <localleader> :<C-U>LeaderGuideVisual ','<CR>
"
" " Define prefix dictionary
let g:lmap =  {}
let g:lmap.f = { 'name' : 'File Menu' }
let g:lmap.f.c = { 'name' : 'Config Files' }
" let g:lmap.o = { 'name' : 'Open Stuff' }
" let g:lmap.r = { 'name' : 'rc Config Files' }
" " 'name' is a special field. It will define the name of the group.
" " leader-f is the "File Menu" group.
" " Unnamed groups will show an empty string
"
call leaderGuide#register_prefix_descriptions(' ', "g:lmap")

let g:llmap =  {}
call leaderGuide#register_prefix_descriptions(',', "g:llmap")

autocmd FileType gitcommit  noremap <buffer> <leader> <Plug>leaderguide-buffer
" " for fugitive
"
autocmd BufEnter tagbar  noremap <buffer> <leader> <Plug>leaderguide-buffer
" " for tagbar
