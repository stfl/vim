" ----------
" **Plugin settings for vimfiler**
" ----------

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
"let g:vimfiler_preview_action = 'auto_preview'

let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'

let g:vimfiler_ignore_pattern =
         \ '^\%(\.git\|\.svn|\.idea\|\.DS_Store\|\.vagrant\|\.stversions'
         \ .'\|node_modules\|.*\.pyc\|.*\.egg-info\|__pycache__\)$'

call vimfiler#custom#profile('default', 'context', {
         \  'safe': 0,
         \  'auto_expand': 1,
         \  'no_quit': 1,
         \  'force_hide': 1,
         \  'parent': 0,
         \  'toggle': 1,
         \  'explorer': 1,
         \  'auto-cd': 1,
         \ })
         " \  'winwidth': 25,
         " \  'split': 1,
         " \  'direction': 'topleft',

" Open VimFilerExplorer if vim is started without arguments
autocmd MyAutoCmd VimEnter * if !argc() | VimFilerExplorer | endif

nnoremap <leader>v :VimFilerSplit<cr>
nnoremap <leader>e :VimFilerExplorer<cr>
nnoremap <leader>t :VimFilerTab<CR>
