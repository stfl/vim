" Plugins {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

Plug '~/mybin/Plugin-ReleaseNotes/Plugin-ReleaseNotes', { 'for': 'ReleaseNotes' }

Plug 'altercation/vim-colors-solarized'

" zoom into one split windo with <c-w-o>
Plug 'vim-scripts/ZoomWin'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
set noshowmode     " don't show the current mode (not needed with airline)

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" http://www.vim.org/scripts/script.php?script_id=273
" Plug 'vim-scripts/taglist.vim'

Plug 'tpope/vim-surround'

" Fuzzy file, buffer, mru, tag, etc finder.  http://kien.github.com/ctrlp.vim
Plug 'kien/ctrlp.vim'
" open file in new tab with <c-t> = default
" let g:ctrlp_open_new_file = 't'
nnoremap <leader>p :CtrlPTag<cr>

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
nnoremap <F6> :TagbarToggle<CR>

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" nnoremap <F3> :NERDTreeToggle<CR>
" Plug 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_gui_startup = 0
" let NERDTreeHijackNetrw=1

" Plug 'tpope/vim-vinegar'

Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1

" a Git wrapper so awesome, it should be illegal
" http://www.vim.org/scripts/script.php?script_id=2975
Plug 'tpope/vim-fugitive'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
let g:gitgutter_enabled = 0 " default off
" let g:gitgutter_sign_column_always = 1
" If you experience a lag, you can trade speed for accuracy:
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

" VIM SVN plugin ( subversion svn vim7)
Plug 'juneedahamed/svnj.vim'
let g:svnj_custom_statusbar_ops_hide = 1
   " Supported operations are listed on the status line of the svnj_window. With growing support for
   " many commands, recomend to hide it. You can still have a quick glance of supported operations by
   " pressing ? (question-mark)
let g:svnj_browse_cache_all = 1
   " This enables caching, Listing of files will be faster, On MAC/Unix the default location is $HOME/.cache.
   " A new directory svnj will be created in the specified directory.


" Plug to toggle, display and navigate marks
" let g:SignatureMarkerTextHLDynamic=1
" let g:SignatureMarksTextHLDynamic=1
" Plug 'kshenoy/vim-signature'
" let g:SignatureEnabledAtStartup=1

Plug 'will133/vim-dirdiff'
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*~,.svn,.git,*.o"

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

Plug 'Lokaltog/vim-easymotion'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plug 'klen/python-mode', { 'for': 'python' }
let g:pymode_python = 'python3'

" Plug 'vim-scripts/Conque-GDB'
" let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
" let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
" let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
if has("persistent_undo")
   set undodir=~/.vim/undodir
   set undofile
endif
nnoremap <F5> :UndotreeToggle<cr>

" adds support for ansi escape characters - useful for vimpager
" Plug 'powerman/vim-plugin-AnsiEsc'

" Plug 'jszakmeister/vim-togglecursor'
" let g:togglecursor_insert='line'
" let g:togglecursor_default='block'
" let g:togglecursor_force='xterm'
" try with disabling nvim settings!!!
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Add plugins to &runtimepath
call plug#end()

" All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required
" }}}

" Settings {{{
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
if exists('$TMUX') && !has('nvim')
  set ttymouse=xterm2 " Support resizing in tmux
endif

" better copy & pase behabour
set pastetoggle=<F2>
" inoremap <F2> <Esc>:set toggle!<CR>i
if has('nvim')
   if (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
      set clipboard+=unnamedplus " Use the OS clipboard by default
   endif
elseif version >= 703
   set clipboard+=unnamedplus " Use the OS clipboard by default
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
let mapleader = "-"  " rebmap the <Leader> key
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

" colorization and styles {{{
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

" key mappings {{{
inoremap jk <Esc>
inoremap <Esc> <nop>

" split naviagetion
" split vertically
nnoremap <leader>v :Vex<CR>
" nnoremap <leader>v <C-w>v<C-w>l
" split vertically
nnoremap <leader>s :Sex<CR>
" nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map Ctrl - Y to save file
nnoremap <silent> <C-y> :update<CR>
vnoremap <C-Y> <Esc>:update<CR>
inoremap <C-Y> <Esc>:update<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv

" map Ctrl-M to remove highlight from last search
noremap <C-m> :nohl<CR>
" maps <CR> to :nohl in vim - TODO

" search for current word in project: acording to current dir!!
nnoremap <leader>* :Ack! <c-r><c-w><cr>

" usefull keys from US-Keyboard - maped to German
" for tags
nmap ü <C-]>
nmap ö [
omap ö [
nmap ä ]
omap ä ]
nmap Ö {
omap Ö {
nmap Ä }
omap Ä }
nmap ß /
omap ß /
noremap ää ]]
noremap öö [[
noremap öä []
noremap äö ][
nnoremap ZAQ :qa!<CR>
nnoremap ZAZ :wqa<CR>

" vim-easymotion mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
nmap <leader>/ <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" nnoremap <C-X>x <C-X>
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>n <Plug>(easymotion-n)
map <leader>N <Plug>(easymotion-N)
" map <Leader>f <Plug>(easymotion-f)
" map <Leader>F <Plug>(easymotion-F)
" map <Leader>t <Plug>(easymotion-t)
" map <Leader>T <Plug>(easymotion-T)
" map <Leader>w <Plug>(easymotion-w)
" map <Leader>W <Plug>(easymotion-W)

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

" Functions {{{
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

" Frequentis specifics {{{

"adds user and timestamp to end of line
nmap <F4> :r! echo "(slendl on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>k J
autocmd BufRead MakePkg setlocal noexpandtab filetype=make

command! TargetOn execute 'set scrolloff=15 | %s/t on="false/t on="true/gc | set scrolloff=5'
command! TargetOff execute 'set scrolloff=15 | %s/t on="true/t on="false/gc | set scrolloff=15'

" }}}

