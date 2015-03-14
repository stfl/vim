set nocompatible

" format
set autoindent
set backup
set nu
set smartindent
set showmatch
set textwidth=80
set title
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

set incsearch
set hlsearch

" syntax
syntax on
set number

set mouse=a
set clipboard=unnamedplus " set y to clipboard

" support 256 colors in Lion terminal 
" set t_Co=256

" always show file name
set modeline
set ls=2

if has('gui_running')
   set background=light
else
   set background=dark
   let g:solarized_termtrans = 1
endif
colorscheme solarized

"adds user and timestamp to end of line
vmap <c-s-c> "+y
nmap <c-s-v> "+gP
imap <c-s-v> <ESC>"+gP
nmap <c-s-a> ggVG
imap <c-s-a> <ESC>ggvG

" Search for selected text, forwards or backwards. first * then n/N ->
" multiple * does not work
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

