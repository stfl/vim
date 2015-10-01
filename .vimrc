" Plugins
" {{{
set nocompatible              " be iMproved, requiredj
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
let g:airline_powerline_fonts = 1
set noshowmode     " don't show the current mode (not needed with airline)

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" http://www.vim.org/scripts/script.php?script_id=273
" Plugin 'vim-scripts/taglist.vim'

Plugin 'tpope/vim-surround'

" Fuzzy file, buffer, mru, tag, etc finder.  http://kien.github.com/ctrlp.vim
Plugin 'kien/ctrlp.vim'
" open file in new tab with <c-t> = default
" let g:ctrlp_open_new_file = 't'
nnoremap <leader>p :CtrlPTag<cr>

" Vim plugin that displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'
nnoremap <F6> :TagbarToggle<CR>

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <F3> :NERDTreeTabsToggle<CR>

Plugin 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1

" a Git wrapper so awesome, it should be illegal
" http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-fugitive'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
" Plugin 'airblade/vim-gitgutter'
" let g:gitgutter_sign_column_always = 1

" VIM SVN plugin ( subversion svn vim7)
Plugin 'juneedahamed/svnj.vim'
let g:svnj_custom_statusbar_ops_hide = 1
   " Supported operations are listed on the status line of the svnj_window. With growing support for
   " many commands, recomend to hide it. You can still have a quick glance of supported operations by
   " pressing ? (question-mark)
let g:svnj_browse_cache_all = 1
   " This enables caching, Listing of files will be faster, On MAC/Unix the default location is $HOME/.cache.
   " A new directory svnj will be created in the specified directory.


" Plugin to toggle, display and navigate marks
" let g:SignatureMarkerTextHLDynamic=1
" let g:SignatureMarksTextHLDynamic=1
" Plugin 'kshenoy/vim-signature'
" let g:SignatureEnabledAtStartup=1

Plugin 'will133/vim-dirdiff'
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*~,.svn,.git,*.o"

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'haya14busa/vim-easyoperator-line'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plugin 'klen/python-mode'
let g:pymode_python = 'python3'

Plugin 'vim-scripts/Conque-GDB'
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

Plugin 'mileszs/ack.vim'
" if executable('ack')
" endif

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
" }}}

" Settings
" {{{
autocmd! bufwritepost .vimrc source % " automatic reload .vimrc
set autoread          " Set to auto read when a file is changed from the outside

" format
set autoindent
set smartindent
set expandtab  " tab expansion
" set textwidth=80
set tabstop=3
set shiftwidth=3
set softtabstop=3
set scrolloff=5  " scroll offset for searching

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
set wildmenu          " completion menu in comand menu
set wildmode=list:longest,list:full
set bs=2              " make backspace bahve like normal
set mouse=a           " Enable mouse in all modes
if exists('$TMUX')
  set ttymouse=xterm2 " Support resizing in tmux
endif

" better copy & pase behabour
set pastetoggle=<F2>
if version >= 703
   set clipboard=unnamedplus " Use the OS clipboard by default
endif

syntax on        " Syntax highlighting
set complete=.,w,b,u,t,i,kspell  " where the completion should look, spellcheck completion if :set spell
set number       " Show line numbers
set showcmd      " Show the (partial) command as it's being typed
set ruler        " Show the cursor position all the time
set cursorline   " Highlight current line
set laststatus=2 " always show status line
set showmatch    " Cursor shows matching ) and }
" set showmode     " Show the current mode
let mapleader = ","  " rebmap the <Leader> key
set timeoutlen=1000
set ttimeoutlen=10  " timeout leaving Insert

" show whitespaces
set list
set listchars=tab:»\ ,eol:¬,trail:·,extends:>,precedes:<
nnoremap <F7> :call TogleVisibility()<CR>
nnoremap <leader><F7> :set list!<CR>

" allow folding at markers
set foldmethod=marker

" make vim look for tags file reverse-recursivly ;)
set tags=./tags,./TAGS,tags;TAGS;

" vimdiff stuff
" ignore whitespace
set diffopt=filler,vertical,iwhite

" if &diff
   " set nolist
" endif
" }}}

" colorization and styles
" {{{
let g:solarized_contrast = "high"
" let g:solarized_diffmode = "high"
let g:solarized_visibility = "low"
if has('gui_running')
   set background=light
   set guifont=Anonymous\ Pro\ for\ Powerline\ 11
      " https://github.com/powerline/fonts
   if &diff  " make fullscreen if gvimdiff
      set lines=999
      set columns=999
   else " set to ~half the screen
      " set lines=999
      " set columns=120
   endif
else
   set background=dark
   let g:solarized_termtrans = 1
   let &t_Co=256
endif
colorscheme solarized

if version >= 703
   set colorcolumn=80
   let g:solarized_hitrail = 1
endif
" }}}

" key mappings
" {{{
inoremap jk <Esc>
inoremap <Esc> <nop>

" if has('gui_running')
   " " fix pasting with c-s-v in insert mode for gvim  - no distinction between
   " " c-v and c-s-v...
   " " vmap <c-s-c> "+y
   " " nmap <C-S-v> "+gp
   " imap <c-s-v> <ESC>"+gp
" endif

" split naviagetion
nnoremap <leader>v <C-w>v<C-w>l
" split vertically
nnoremap <leader>s <C-w>s
" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map Ctrl - Y to save file - Ctrl-S doesn't work in terminal...
" I like to be in normal mode afterwards
nnoremap <silent> <C-y> :update<CR>
vnoremap <C-Y> <Esc>:update<CR>
inoremap <C-Y> <Esc>:update<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv

" map Ctrl-M to remove highlight from last search
noremap <C-m> :nohl<CR>
" maps <CR> to :nohl in vim - TODO

" usefull keys from US-Keyboard - maped to German
" for tags
noremap ü <C-]>
noremap ö [
noremap ä ]
noremap Ö {
noremap Ä }
noremap ß /
noremap ää ]]
noremap öö [[
noremap öä []
noremap äö ][
nnoremap ZAQ :qa!<CR>
nnoremap ZAZ :wqa<CR>

" search for current word in project: acording to current dir!!
nnoremap <leader>* :Ack! <c-r><c-w><cr>

" Search for selected text, forwards or backwards. first * then n/N ->
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
" }}}

" Functions
" {{{
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

function! TogleVisibility()
   if (&list == 0)
      set list
   else
      if (g:solarized_visibility == "low")
         let g:solarized_visibility = "normal"
      elseif (g:solarized_visibility == "normal")
         let g:solarized_visibility = "low"
      endif
      colorscheme solarized
   endif
endfunction

" Change font size quickly - http://vim.wikia.com/wiki/Change_font_size_quickly
nnoremap <leader>+ :LargerFont<cr>
nnoremap <leader>- :SmallerFont<cr>
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()


" This diff function uses "-w" instead of "-b", to ignore *all* whitespace
" changes (not only non-leading whitespace)
set diffexpr=MyDiff()
" if !exists("*MyDiff")
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
" endif
" }}}
"
" Frequentis specifics
" {{{

"adds user and timestamp to end of line
nmap <F4> :r! echo "(slendl on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>k J
autocmd BufRead MakePkg setlocal noexpandtab filetype=make

command! TargetOn execute 'set scrolloff=15 | %s/t on="false/t on="true/gc | set scrolloff=5'
command! TargetOff execute 'set scrolloff=15 | %s/t on="true/t on="false/gc | set scrolloff=15'

" }}}

