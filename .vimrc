set nocompatible " Make Vim more useful

" format
set autoindent
set nu
set smartindent
set textwidth=80
set tabstop=3
set shiftwidth=3
set softtabstop=3
" set expandtab

set backup
set backupdir=~/.vimtmp,.  " save backup file (*~) somewhere else
set directory=~/.vimtmp,.

" searching
set hlsearch   " Search highlighting
set incsearch  " Incremental search
set ignorecase " Ignore case when searching
set smartcase  " Ignore case if search pattern is all lc, cs or otherwise

" syntax
syntax on
set number
set expandtab			 " tab expansion
set encoding=utf-8    " Set utf-8 as standard encoding
set clipboard=unnamed " Use the OS clipboard by default
set wildmenu          " Wild char completion menu
set wildmode=list:longest,list:full
set mouse=a           " Enable mouse in all modes
if exists('$TMUX')
  set ttymouse=xterm2 " Support resizing in tmux
endif
set autoread          " Set to auto read when a file is changed from the outside

syntax on        " Syntax highlighting
set number       " Show line numbers
set showcmd      " Show the (partial) command as it's being typed
set laststatus=2 " Always show status line
set title        " Change the terminal's title
set ruler        " Show the cursor position all the time
set cursorline   " Highlight current line
set showmatch    " Cursor shows matching ) and }
set showmode     " Show the current mode
if version >= 703
   set colorcolumn=80
endif


if has('gui_running')
   set background=light
else
   set background=dark
   let g:solarized_termtrans = 1
endif
colorscheme solarized

"adds user and timestamp to end of line
nmap <F4> :r! echo "(${USER} on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>k J
vmap <c-s-c> "+y
nmap <c-s-v> "+gp
imap <c-s-v> <ESC>"+gp
nmap <c-s-a> ggVG
imap <c-s-a> <ESC>ggvG

" tab navigation like firefox - only works in gvim
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

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

