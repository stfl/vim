" deoplete for nvim
" ---

let g:deoplete#enable_at_startup = 1

autocmd CompleteDone * pclose!

" let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#tag#cache_limit_size = 5000000

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'

" Go
let g:deoplete#sources#go = 'vim-go'


" Python
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#statement_length = 30
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#short_types = 1

autocmd FileType python setlocal omnifunc=

let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
let g:deoplete#omni#input_patterns.python = ''

" Javascript
let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\%\(\h\w*\)\?'
let g:deoplete#omni#input_patterns.php = '\w+|[^. \t]->\w*|\w+::\w*'
let g:deoplete#member#prefix_patterns = get(g:, 'deoplete#member#prefix_patterns', {})
let g:deoplete#member#prefix_patterns.javascript = ['\.']

call deoplete#custom#set('_', 'converters', [
         \ 'converter_remove_paren',
         \ 'converter_remove_overlap',
         \ 'converter_truncate_abbr',
         \ 'converter_truncate_menu',
         \ 'converter_auto_delimiter',
         \ ])

" Mappings
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" " Movement within 'ins-completion-menu'
" imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
" imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" " Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Undo completion
inoremap <expr><C-g> deoplete#undo_completion()

" Redraw candidates
inoremap <expr><C-l> deoplete#refresh()

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
imap <silent><expr><CR> pumvisible() ?
  \ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#close_popup())
    \ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}
