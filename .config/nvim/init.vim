" This File is called at the very start

" Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
   set nocompatible               " Be iMproved
endif

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

augroup MyAutoCmd
   autocmd!
augroup END

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
" if dein#load_state(s:path)
   call dein#begin(s:path, [$MYVIMRC, '$HOME/.config/nvim/plugins/plugins.vim'])
   source $HOME/.config/nvim/plugins/plugins.vim
   call dein#end()
   " call dein#save_state()
   if dein#check_install()
      if ! has('nvim')
         set nomore
      endif
      call dein#install()
   endif
" endif

" mappings can later be overwritten in plugin_all.vim
source $HOME/.config/nvim/mappings.vim

" plugin specific settings
source $HOME/.config/nvim/plugins/other.vim

if !has('vim_starting')
   call dein#call_hook('source')
   call dein#call_hook('post_source')

   filetype plugin indent on
   syntax enable
endif

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

" source $HOME/.config/nvim/plugins/deoplete.vim
set secure


" Frequentis specifics
"adds user and timestamp to end of line
nnoremap <F4> :r! echo "(slendl on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>kJ
autocmd MyAutoCmd BufRead MakePkg setlocal noexpandtab filetype=make
autocmd MyAutoCmd BufRead ReleaseNotes setlocal textwidth=80 colorcolumn=80 spell spelllang=en_us

command! TargetOn execute 'set scrolloff=15 | %s/t on="false/t on="true/gc | set scrolloff=5'
command! TargetOff execute 'set scrolloff=15 | %s/t on="true/t on="false/gc | set scrolloff=5'

