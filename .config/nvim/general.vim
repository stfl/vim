set autoread          " Set to auto read when a file is changed from the outside

" Tabs and Indents
set smartindent
set expandtab      " tab expansion to spaces
set smarttab
set tabstop=3
set shiftwidth=3
set shiftround      " Round indent to multiple of 'shiftwidth'
set softtabstop=3
set scrolloff=5    " scroll offset at begining and end of line
set textwidth=100  " line break after 100 char

if has('patch-7.3.541')
   set formatoptions+=j       " Remove comment leader when joining lines
endif

"
" Searching
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file

set showmatch       " Jump to matching bracket
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
set matchtime=1     " Tenths of a second to show the matching paren
set matchpairs+=<:> " Add HTML brackets to pair matching
au MyAutoCmd FileType c,cpp set matchpairs-=<:>
"
" General

set history=500              " Search and commands remembered
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text

set modeline                 " automatically setting options from modelines
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
" set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on

if has('vim_starting')
   set encoding=utf-8
   scriptencoding utf-8
endif

"
" Vim Directories
" ---------------
if has('nvim')
   set shada='30,/100,:50,<10,@10,s50,h,n~/.vim/shada
else
   set viminfo='30,/100,:500,<10,@10,s10,h,n~/.vim/viminfo
endif
set undofile swapfile backup
set undodir=~/.vim/undodir
set backupdir=~/.vim/tmp,.  " save backup file (*~) somewhere else
set directory=~/.vim/tmp,.
let g:session_directory = '~/.vim/session/'

" Don't backup files in temp directories or shm
if exists('&backupskip')
   set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
endif

" Don't keep swap files in temp directories or shm
augroup swapskip
   autocmd!
   silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
            \ setlocal noswapfile
augroup END

" Don't keep undo files in temp directories or shm
if has('persistent_undo')
   augroup undoskip
      autocmd!
      silent! autocmd BufWritePre
               \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
               \ setlocal noundofile
   augroup END
endif

" Don't keep viminfo for files in temp directories or shm
augroup viminfoskip
   autocmd!
   silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
            \ setlocal viminfo=
augroup END

"
" Wildmenu

if has('wildmenu')
   set wildmenu
   set wildmode=list:longest,full
   set wildoptions=tagfile
   set wildignorecase
   set wildignore+=.git,*.pyc,*.spl,*.o,*.out,*~,#*#,%*
   set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
endif

"
" Mouse

set mouse=a           " Enable mouse in all modes
if exists('$TMUX') && !has('nvim')
   if has("mouse_sgr")
      set ttymouse=sgr
   else
      set ttymouse=xterm2 " Support resizing in tmux
   endif
endif

"
" clipboard

set pastetoggle=<F2>      " better copy & pase behabour
if ( ! has('nvim') && has('clipboard'))
   if has('unnamedplus') || executable('pbcopy') || executable('xclip') || executable('xsel')
      set clipboard& clipboard+=unnamedplus
   else
      set clipboard& clipboard+=unnamed
   endif
elseif (executable('pbcopy') || executable('xclip') || executable('xsel'))
   " nvim
   set clipboard& clipboard+=unnamedplus
endif

"
" Behavior

syntax on        " Syntax highlighting
" set complete=.,w,b,u,t,i,kspell  " where the completion should look, spellcheck completion if :set spell
set complete=.,kspell
set foldmethod=marker            " allow folding at markers
" set foldcolumn=3
set foldnestmax=3
set diffopt=filler,vertical,iwhite  " ignore whitespace
set splitbelow splitright        " Splits open bottom right
set switchbuf=usetab,split       " Switch buffer behavior
set backspace=indent,eol,start   " Intuitive backspacing in insert mode
set showfulltag                  " Show tag and tidy search in completion
set linebreak                    " Break long lines at 'breakat'
set breakat=\ \	;:,!?            " Long lines break chars
set nostartofline                " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~     " Move to following line on certain keys
set completeopt=menuone          " Show menu even for one item
set completeopt+=noselect        " Do not select a match in the menu
if has('patch-7.4.775')
   set completeopt+=noinsert     " do not insert the selected
endif
if has('cscope')
   set cscopetag                  " use cscope db when C-]
   set cscopeverbose
endif

"
" Editor UI Appearance

set list              " show whitespaces
set listchars=tab:»\ ,eol:¬,trail:·,extends:>,precedes:<
set cursorline          " Highlight current line
set number              " Show line numbers
set showcmd             " Show the (partial) command as it's being typed
set noruler             " don't show the cursor position all the time
set laststatus=2        " always show status line
set noshowmode          " don't Show the current mode
" set shortmess=aoOTI     " Shorten messages and don't show intro

set showtabline=2       " Always show the tabs line
set tabpagemax=30       " Maximum number of tab pages
set winwidth=30         " Minimum width for current window
set winheight=1         " Minimum height for current window
set previewheight=8     " Completion preview height
set helpheight=12       " Minimum help window height

" Do not display completion messages
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
" if has('patch-7.4.314')
   " set shortmess+=c
" endif

" Do not display message when editing files
if has('patch-7.4.1570')
   set shortmess+=F
endif

if has('conceal') && v:version >= 703
   set conceallevel=2 concealcursor=nv
endif

"
" Time
" --------
set timeout ttimeout
set timeoutlen=1000  " Time out on mappings
set ttimeoutlen=250  " Time out on key codes
set updatetime=1500  " Idle time to write swap and trigger CursorHold

if has('nvim')
   " https://github.com/neovim/neovim/issues/2017
   set ttimeoutlen=-1
endif

" Make directory automatically. {{{
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" }}}
" MyDiff {{{
" This diff function uses "-w" instead of "-b", to ignore *all* whitespace
" changes (not only non-leading whitespace)
set diffexpr=MyDiff()
function! MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
      let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
      let opt = opt . "-w "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
            \  " > " . v:fname_out
endfunction

" }}}
" Remember cursor position between vim sessions {{{
autocmd MyAutoCmd BufReadPost *
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
         \   exe "normal! g'\"" |
         \ endif
" center buffer around cursor when opening files
autocmd MyAutoCmd BufRead * normal zz

" }}}
