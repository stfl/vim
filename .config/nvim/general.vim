" -----------
"  General
" -----------

set autoread          " Set to auto read when a file is changed from the outside

" Tabs and Indents {{{
set smartindent
set expandtab      " tab expansion to spaces
set smarttab
set tabstop=2
set shiftwidth=2
set shiftround      " Round indent to multiple of 'shiftwidth'
set softtabstop=2
set scrolloff=5    " scroll offset at begining and end of line
set sidescrolloff=5     " Keep at least 5 lines left/right
set textwidth=100  " line break after 100 char
set nojoinspaces   " when joining lines (J, gq), do not put a double space after .!?

if has('patch-7.3.541')
   set formatoptions+=j       " Remove comment leader when joining lines
endif

" }}}
" Searching {{{
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

" }}}
" General {{{

set history=500              " Search and commands remembered
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set inccommand=split         " show substitute preview

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

" }}}
" Vim Directories {{{
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

" }}}
" Wildmenu {{{

if has('wildmenu')
   set wildmenu
   set wildmode=list:longest,full
   set wildoptions=tagfile
   set wildignorecase
   set wildignore+=.git,*.pyc,*.spl,*.o,*.out,*~,#*#,%*
   set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
endif

" }}}
" Mouse {{{
"

set mouse=a           " Enable mouse in all modes
set mousemodel=popup_setpos
if exists('$TMUX') && !has('nvim')
   if has("mouse_sgr")
      set ttymouse=sgr
   else
      set ttymouse=xterm2 " Support resizing in tmux
   endif
endif

" }}}
" clipboard {{{

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

" }}}
" Behavior {{{

syntax on        " Syntax highlighting
" set complete=.,w,b,u,t,i,kspell  " where the completion should look, spellcheck completion if :set spell
set complete=.
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
" if glob('/usr/share/dict/usa')
   " setlocal dictionary+=/usr/share/dict/usa
" endif
if has('patch-7.4.775')
   " set completeopt+=noinsert     " do not insert the selected
endif
if has('cscope') " && executable('cscope')
   set cscopetag                  " use cscope db when C-]
   set cscopeverbose
endif


" }}}
" Time {{{
" --------
set timeout ttimeout
set timeoutlen=1000  " Time out on mappings
set ttimeoutlen=250  " Time out on key codes
set updatetime=1500  " Idle time to write swap and trigger CursorHold

if has('nvim')
   " https://github.com/neovim/neovim/issues/2017
   set ttimeoutlen=-1
endif

" }}}
" Editor UI Appearance {{{

set list              " show whitespaces
set cursorline          " Highlight current line
set number              " Show line numbers
set showcmd             " Show the (partial) command as it's being typed
set noruler             " don't show the cursor position all the time
set laststatus=2        " always show status line
set noshowmode          " don't Show the current mode
set shortmess=aoOTI     " Shorten messages and don't show intro
set display=lastline

set showtabline=2       " Always show the tabs line
set tabpagemax=30       " Maximum number of tab pages
set winwidth=30         " Minimum width for current window
set winheight=1         " Minimum height for current window
set previewheight=8     " Completion preview height
set helpheight=12       " Minimum help window height

set fillchars=vert:│,fold:-
set listchars=tab:\┆\ ,eol:¬,extends:⟫,precedes:⟪,nbsp:.,trail:·

" Do not display completion messages
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
if has('patch-7.4.314')
   set shortmess+=c
endif

" Do not display message when editing files
if has('patch-7.4.1570')
   set shortmess+=F
endif

if has('conceal') && v:version >= 703
   set conceallevel=2 concealcursor=nv
endif

" Folds {{{
" -----


" FastFold
" Credits: https://github.com/Shougo/shougo-s-github
autocmd MyAutoCmd TextChangedI,TextChanged *
      \ if &l:foldenable && &l:foldmethod !=# 'manual' |
      \   let b:foldmethod_save = &l:foldmethod |
      \   let &l:foldmethod = 'manual' |
      \ endif

autocmd MyAutoCmd BufWritePost *
      \ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
      \   let &l:foldmethod = b:foldmethod_save |
      \   execute 'normal! zx' |
      \ endif

if has('folding')
  set foldenable
  set foldmethod=syntax
  set foldlevelstart=99
  " set foldcolumn=3
  set foldnestmax=2
  set foldminlines=3

  set foldtext=FoldText()
endif

" " Nicer fold text
" " See: http://dhruvasagar.com/2013/03/28/vim-better-foldtext
" function! FoldText() "{{{
"   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"   let lines_count = v:foldend - v:foldstart + 1
"   let lines_count_text = '| ' . printf('%10s', lines_count . ' lines') . ' |'
"   let foldchar = matchstr(&fillchars, 'fold:\zs.')
"   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"   let foldtextend = lines_count_text . repeat(foldchar, 8)
"   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction "}}}
" set foldtext=FoldText()
" set foldmethod=marker            " allow folding at markers

" Improved Vim fold-text
" See: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! FoldText()
  " Get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = ' ' . foldSize . ' lines '
  let foldLevelStr = repeat('+--', v:foldlevel)
  let lineCount = line('$')
  let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
  let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction



" }}}
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
" Highlight words to avoid in tech writing {{{
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
   match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

" }}}

