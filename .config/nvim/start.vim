" Vim Initialization
" ------------------

" Global Mappings "{{{
" Use spacebar instead of '\' as leader. Require before loading plugins.
let g:mapleader="\<Space>"
let g:maplocalleader=','

" Release keymappings for plug-in.
nnoremap ;  <Nop>
xnoremap ;  <Nop>
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>
nnoremap ,        <Nop>
xnoremap ,        <Nop>

" }}}
"Setup dein {{{
if &runtimepath !~# '/dein.vim'
   let s:dein_dir = expand('$HOME/.config/nvim/dein.vim').'/repos/github.com/Shougo/dein.vim'
   if ! isdirectory(s:dein_dir)
      echom "installing dein.vim" s:dein_dir
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
   endif

   execute 'set runtimepath+='.substitute( fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

" }}}
" Load less plugins while SSHing to remote machines {{{
if len($SSH_CLIENT)
	let $VIM_MINIMAL = 1
endif

" }}}
" Function to Check if Version is is newer {{{
function! VerNewerThen(min, current)
" return 1 with version $current is newer then version $min
   if has('nvim')
      " neovim makes sth wierd with the string in system()
      return 1
   else
      return system("[  \"".a:min."\" = \"`echo -e \"".a:min."\\n".a:current." | sort -V | head -n1`\" ] && echo 1 || echo 0")
   endif
endfunction

" }}}
" Disable default plugins "{{{

" Disable menu.vim
" if has('gui_running')
"   set guioptions=Mc
" endif

" Disable pre-bundled plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
" let g:loaded_gzip = 1
let g:loaded_LogiPat = 1
let g:loaded_logipat = 1
" let g:loaded_man = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
" let g:loaded_spellfile_plugin  = 1
" let g:loaded_tar = 1
" let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
" let g:loaded_zip = 1
" let g:loaded_zipPlugin = 1
" }}}
