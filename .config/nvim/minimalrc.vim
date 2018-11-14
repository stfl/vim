
augroup MyAutoCmd
   autocmd!
augroup END

set nocompatible               " Be iMproved

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

call dein#add('autozimu/LanguageClient-neovim', {
      \ 'rev': 'next',
      \ 'build': 'bash install.sh',
      \ })

" " Deoplete {{{
" call dein#add('Shougo/context_filetype.vim')
" call dein#add('Shougo/deoplete.nvim', {
"          \ 'depends': 'context_filetype.vim',
"          \ 'if': 'has("nvim")',
"          \ 'on_i': 1,
"          \ 'hook_source': 'let g:deoplete#enable_at_startup = 1'
"          \   .' | source $HOME/.config/nvim/deoplete.vim'
"          \ })

" call dein#add('Shougo/neoinclude.vim', {'on_if': 1})

   call dein#end()

" mappings can later be overwritten in plugin_all.vim
source $HOME/.config/nvim/mappings.vim

" plugin specific settings
" source $HOME/.config/nvim/plugins_all.vim

" if !has('vim_starting')
   call dein#call_hook('source')
	call dein#call_hook('post_source')

   filetype plugin indent on
   syntax enable
" endif

" }}}
" Loading configuration modules {{{

" source $HOME/.config/nvim/general.vim
" call s:my_on_filetype()
" source $HOME/.config/nvim/utils.vim
" source $HOME/.config/nvim/filetypes.vim
" source $HOME/.config/nvim/theme.vim


  let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ }

        " \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        " \ 'python': ['/usr/local/bin/pyls'],

  let $RUST_BACKTRACE = 1
  let g:LanguageClient_loggingLevel = 'INFO'
  let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
  let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

  nnoremap <F5> :<c-u>call LanguageClient_contextMenu()<CR>
  " Or map each action separately
  nnoremap <silent> K :<c-u>call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <localleader>d :<c-u>call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <localleader>r :<c-u>call LanguageClient#textDocument_rename()<CR>

  let g:LanguageClient_autoStart = 1

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

