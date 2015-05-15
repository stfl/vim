set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

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

Plugin 'bling/vim-airline'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" http://www.vim.org/scripts/script.php?script_id=273
" Plugin 'vim-scripts/taglist.vim'

Plugin 'tpope/vim-surround'

" Fuzzy file, buffer, mru, tag, etc finder.  http://kien.github.com/ctrlp.vim
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1

" a Git wrapper so awesome, it should be illegal 
" http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-fugitive'
Plugin 'will133/vim-dirdiff'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'haya14busa/vim-easyoperator-line'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plugin 'klen/python-mode'
let g:pymode_python = 'python3'

" adds support for ansi escape characters - useful for vimpager
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

autocmd! bufwritepost .vimrc source % " automatic reload .vimrc
set autoread          " Set to auto read when a file is changed from the outside

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
set wildmenu          " Wild char completion menu
set wildmode=list:longest,list:full
set bs=2          " make backspace bahve like normal
set mouse=a           " Enable mouse in all modes
if exists('$TMUX')
  set ttymouse=xterm2 " Support resizing in tmux
endif

" better copy & pase behabour
set pastetoggle=<F2>
set clipboard=unnamedplus " Use the OS clipboard by default

syntax on        " Syntax highlighting
set number       " Show line numbers
set showcmd      " Show the (partial) command as it's being typed
set ruler        " Show the cursor position all the time
set cursorline   " Highlight current line
set laststatus=2 " always show status line
set showmatch    " Cursor shows matching ) and }
set showmode     " Show the current mode
let mapleader = ","  " rebmap the <Leader> key

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nnoremap <F7> :set list!<CR>  " toggle show whitespaces

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv

" colorization
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

" ================================
" key mappings
"vmap <c-s-c> "+y
"nmap <c-s-v> "+gp
"imap <c-s-v> <ESC>"+gp
"nmap <c-s-a> ggVG
" imap <c-s-a> <ESC>ggVG

" map Ctrl - S to save file
" i like to be in normal mode afterwards
nnoremap <silent> <C-s> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>
vnoremap <C-S> <Esc>:update<CR>
" inoremap <C-S> <C-O>:update<CR>
inoremap <C-S> <Esc>:update<CR>

" map Ctrl-N to remove highlight from last search
"noremap <C-n> :nohl<CR>
"vnoremap <C-n> <C-C>:nohl<CR>
"inoremap <C-n> <C-O>:nohl<CR>

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

