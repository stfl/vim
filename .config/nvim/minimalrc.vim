
augroup MyAutoCmd
   autocmd!
augroup END

set nocompatible               " Be iMproved

function! s:my_on_filetype() abort "{{{
   " if &l:filetype == '' && bufname('%') == ''
     " return
   " endif
   redir => filetype_out
   silent! filetype
   redir END
   if filetype_out =~# 'OFF'
      " Lazy loading
      silent! filetype plugin indent on
      syntax enable
      filetype detect
   endif
endfunction "}}}

" Initialize base requirements {{{
if has('vim_starting')
   source $HOME/.config/nvim/start.vim
   if has('nvim')
      source $HOME/.config/nvim/start_nvim.vim
   endif
endif

" }}}

" Initialize dein.vim (package manager) {{{
let s:path = expand('$HOME/.config/nvim/dein.vim')
   call dein#begin(s:path, [$MYVIMRC, '$HOME/.config/nvim/plugins.vim'])

   " source $HOME/.config/nvim/plugins.vim

call dein#add('Shougo/dein.vim')

call dein#add('lervag/vimtex', {'on_ft': ['tex','latex','bib']})

call dein#add('ujihisa/neco-look', {
         \ 'if': 'executable("look")',
         \ 'on_i': 1,
         \ })

" Deoplete {{{
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/deoplete.nvim', {
         \ 'depends': 'context_filetype.vim',
         \ 'if': 'has("nvim")',
         \ 'on_i': 1,
         \ 'hook_source': 'let g:deoplete#enable_at_startup = 1'
         \   .' | source $HOME/.config/nvim/deoplete.vim'
         \ })

call dein#add('Shougo/neoinclude.vim', {'on_if': 1})

" }}}
" snippets {{{
call dein#add('Shougo/neosnippet.vim', {
         \ 'depends': ['neosnippet-snippets', 'context_filetype.vim'],
         \ 'on_event': 'InsertCharPre',
         \ 'on_ft': 'snippet'
         \ })

call dein#add('Shougo/neosnippet-snippets') ", {'rtp': ''})
call dein#add('honza/vim-snippets') " {'rtp': ''})

   call dein#end()

" mappings can later be overwritten in plugin_all.vim
source $HOME/.config/nvim/mappings.vim


" plugin specific settings
source $HOME/.config/nvim/plugins_all.vim

" if !has('vim_starting')
   call dein#call_hook('source')
	call dein#call_hook('post_source')

   filetype plugin indent on
   syntax enable
" endif

" }}}
" Loading configuration modules {{{

source $HOME/.config/nvim/general.vim
call s:my_on_filetype()
source $HOME/.config/nvim/utils.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/theme.vim

" }}}
" Reload vim config automatically {{{
execute 'autocmd MyAutoCmd BufWritePost $HOME/.config/nvim/*vim nested source $MYVIMRC | redraw'
" execute 'autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead,VimEnter * call s:my_on_filetype()'

" }}}


""" CONFIG to test
"""""""""""""""""""'
set secure


" ----------
" deoplete for nvim
" ----------

