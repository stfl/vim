set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'will133/vim-dirdiff'

" if whatever HOSTNAME
" or replace in advance

if !empty(glob("/home/slendl/mybin/Plugin-ReleaseNotes/Plugin-ReleaseNotes"))
   Plugin 'file:///home/slendl/mybin/Plugin-ReleaseNotes/Plugin-ReleaseNotes'
elseif !empty(glob("/home_vie/slendl/mybin/Plugin-ReleaseNotes/Plugin-ReleaseNotes"))
   Plugin 'file:///home_vie/slendl/mybin/Plugin-ReleaseNotes/Plugin-ReleaseNotes'
endif 

Plugin 'altercation/vim-colors-solarized'

" zoom into one split windo with <c-w-o>
Plugin 'vim-scripts/ZoomWin'

" Plugin 'bling/vim-airline'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" http://www.vim.org/scripts/script.php?script_id=273
Plugin 'vim-scripts/taglist.vim'

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'


" a Git wrapper so awesome, it should be illegal 
" http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-fugitive'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'haya14busa/vim-easyoperator-line'


" adds support for ansi escape characters
" Plugin 'powerman/vim-plugin-AnsiEsc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" format
set autoindent
set smartindent
set expandtab			 " tab expansion
" set textwidth=80
set tabstop=3
set shiftwidth=3
set softtabstop=3

set backup
set backupdir=~/.vim/tmp,.  " save backup file (*~) somewhere else
set directory=~/.vim/tmp,.

" searching
set hlsearch   " Search highlighting
set incsearch  " Incremental search
set ignorecase " Ignore case when searching
set smartcase  " Ignore case if search pattern is all lc, cs or otherwise

" syntax
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
set ruler        " Show the cursor position all the time
set cursorline   " Highlight current line
set showmatch    " Cursor shows matching ) and }
set showmode     " Show the current mode

if has('gui_running')
   set background=light
else
   set background=dark
   let g:solarized_termtrans = 1
endif
colorscheme solarized
if version >= 703
   set colorcolumn=80
endif

vmap <c-s-c> "+y
nmap <c-s-v> "+gp
imap <c-s-v> <ESC>"+gp
nmap <c-s-a> ggVG
imap <c-s-a> <ESC>ggVG

" Frequentis specifics
"adds user and timestamp to end of line
nmap <F4> :r! echo "(${USER} on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>k J
autocmd BufRead MakePkg setlocal noexpandtab

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

