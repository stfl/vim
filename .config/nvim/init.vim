" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
function! VerNewerThen(min, current)
" return 1 with version $current is newer then version $min
   if has('nvim')
      " neovim makes sth wierd with the string in system()
      return 1
   else
      return system("[  \"".a:min."\" = \"`echo -e \"".a:min."\\n".a:current." | sort -V | head -n1`\" ] && echo 1 || echo 0")
   endif
endfunction

" Set augroup
augroup MyAutoCmd
	autocmd!
augroup END

set nocompatible               " Be iMproved
"Setup dein
if &runtimepath !~# '/dein.vim'
   let s:dein_dir = expand('$HOME/.config/nvim/dein.vim').'/repos/github.com/Shougo/dein.vim'
   if ! isdirectory(s:dein_dir)
      echom "installing dein.vim" s:dein_dir
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
   endif

   execute 'set runtimepath^='.substitute( fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

"set runtimepath^=$HOME/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim

let s:path = expand('$HOME/.config/nvim/dein.vim')
"if dein#load_state(s:path)
   call dein#begin(s:path, [$MYVIMRC, '$HOME/.config/nvim/plugins.vim'])
   source $HOME/.config/nvim/plugins.vim
   call dein#end()
"   call dein#save_state()
   if has('vim_starting') && dein#check_install()
      if ! has('nvim')
         set nomore
      endif
      call dein#install()
   endif
"endif


"source '$HOME/.config/nvim/plugins_all.vim')

if ! has('vim_starting')
	call dein#call_hook('source')
	call dein#call_hook('post_source')
endif

filetype plugin indent on

"
" Settings
" Reload vim config automatically {{{
execute 'autocmd MyAutoCmd BufWritePost $HOME/.config/nvim/*vim nested'
         \ .' source $MYVIMRC | redraw'
" }}}

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

set fillchars="vert:|,diff: ,fold: "     " make folds prettier"

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

"

" Unite config
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

if has('nvim')
   " nnoremap <C-p> :Unite file_rec/neovim <cr>
else
   " nnoremap <C-p> :Unite file_rec/async <cr>
endif

" yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" like ack / ag
nnoremap <space>/ :Unite grep:.<cr>

" switching buffers
nnoremap <space>s :Unite -quick-match buffer<cr>

" MRU
nnoremap <space>p :Unite file_mru<cr>

"
" colorization and styles
let g:solarized_contrast = "high"
" let g:solarized_diffmode = "high"
let g:solarized_visibility = "low"
" highlight SignColumn guibg=#131313
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

" make search in Gray and white.
hi Search term=reverse cterm=reverse ctermfg=10 ctermbg=15 guibg=DarkGrey
" hi Search term=bold cterm=bold ctermfg=15 ctermbg=10 guibg=DarkGrey
hi Folded term=bold cterm=bold

" fix wierd display of Sign Column Color
if has('gui_running')
   highlight SignColumn ctermbg=white
else
   highlight SignColumn ctermbg=black
endif

if version >= 703
   set colorcolumn=100
   let g:solarized_hitrail = 1
endif


" key mappings  {{{
let mapleader = ","  " rebmap the <Leader> key

noremap ; :
noremap : ;

inoremap jk <Esc>
inoremap <Esc> <nop>
nnoremap Q <nop>

" nmap j <Plug>(accelerated_jk_gj_position)
" nmap k <Plug>(accelerated_jk_gk_position)
noremap <silent> j gj
noremap <silent> k gk

nnoremap <F7> :call TogleVisibility()<CR>
nnoremap <leader><F7> :set list!<CR>

" " split naviagetion
if dein#tap('vim-tmux-navigator')
   nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
   nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
   nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
   nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
   " nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
else
   nnoremap <A-h> <C-w>h
   nnoremap <A-j> <C-w>j
   nnoremap <A-k> <C-w>k
   nnoremap <A-l> <C-w>l
endif

nnoremap ZAQ :qa!<CR>
nnoremap ZAZ :wqa<CR>

" map Ctrl - Y to save file
nnoremap <silent> <C-y> :update<CR>
vnoremap <C-Y> <Esc>:update<CR>
inoremap <C-Y> <Esc>:update<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" diffpu and optain for Vim Fugitive conflicts
" nmap <expr> ]c  &diff ? ']czz' : ']c'
" nmap <expr> [c  &diff ? '[czz' : '[c'
" nmap <expr> <C-J>  &diff ? ']czz' : '<C-J>'
" nmap <expr> <C-K>  &diff ? '[czz' : '<C-K>'
nmap <expr> du  &diff ? ':diffupdate<CR>' : 'du'
nnoremap <expr> do  &diff ? 'do]czz' : 'do'
" vnoremap <expr> do  &diff ? ":'<,'>diffget<CR>:diffupdate<CR>" : 'do'
nnoremap <expr> dp  &diff ? 'dp]czz' : 'dp'
vnoremap <expr> dp  &diff ? ":'<,'>diffput<CR>:diffupdate<CR>" : 'dp'
" nnoremap <expr> 2do  &diff ? ':diffget //2<CR>]czz' : '2do'
" nnoremap <expr> 3do  &diff ? ':diffget //3<CR>]czz' : '3do'

" find {} even if not in the first column
" map [[ ?{<CR>w99[{:nohl<cr>
" map ][ /}<CR>b99]}:nohl<cr>
" map ]] j0[[%/{<CR>:nohl<cr>
" map [] k$][%?}<CR>:nohl<cr>

" map Ctrl-M to remove highlight from last search
nnoremap <C-M> :nohl<CR>
" maps <CR> to :nohl in vim - TODO

" map the F9 key to run make
map <F9> :make<CR>

nnoremap <leader>sv :so $MYVIMRC<CR>:e<CR>
nnoremap <leader>ov :tabe $MYVIMRC<CR>
nnoremap <leader>oz :tabe ~/.zshrc<CR>

" Terminal mappings
if has('nvim')
   nnoremap <leader><C-T> :vsp term://zsh<cr>
   tnoremap <Esc> <C-\><C-n>
   tnoremap jk <C-\><C-n>
   tnoremap <A-h> <C-\><C-n><C-w>h
   tnoremap <A-j> <C-\><C-n><C-w>j
   tnoremap <A-k> <C-\><C-n><C-w>k
   tnoremap <A-l> <C-\><C-n><C-w>l
   tnoremap <C-w><C-w> <C-\><C-n><C-w><c-w>
endif

nnoremap gcc :Gita status<CR>
augroup mygita
   autocmd!
   autocmd FileType gita-commit nmap gcc <Plug>(gita-status-open)
   autocmd FileType gita-status nmap gcc <Plug>(gita-commit-open)
   autocmd FileType gita-commit,gita-status nmap rm <Plug>(gita-rm)
   autocmd FileType gita-commit,gita-status nmap rc <Plug>(gita-rm-cached)
   autocmd FileType gitcommit,gita-commit setlocal spell
augroup END

" :h g:incsearch#auto_nohlsearch
if dein#tap('incsearch.vim')
   set hlsearch
   let g:incsearch#auto_nohlsearch = 1
   map n  <Plug>(incsearch-nohl-n)
   map N  <Plug>(incsearch-nohl-N)
   map *  <Plug>(incsearch-nohl-*)
   map #  <Plug>(incsearch-nohl-#)
   map g* <Plug>(incsearch-nohl-g*)
   map g# <Plug>(incsearch-nohl-g#)

   map /  <Plug>(incsearch-forward)
   map ?  <Plug>(incsearch-backward)
   map g/ <Plug>(incsearch-stay)
endif

" usefull keys from US-Keyboard - maped to German
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
" for tags
nmap ü <C-]>
" select from multiple found tags
" alternativly use :tn :tp
noremap gä g]


" Functions
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

" Remember cursor position between vim sessions
autocmd BufReadPost *
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
         \   exe "normal! g'\"" |
         \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz

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
" Font Size
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

" MyDiff
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

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
   match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
augroup tech_words
   autocmd!
   autocmd FileType markdown,latex call MatchTechWordsToAvoid()
   autocmd BufWinEnter *.md,*.tex call MatchTechWordsToAvoid()
   autocmd InsertEnter *.md,*.tex call MatchTechWordsToAvoid()
   autocmd InsertLeave *.md,*.tex call MatchTechWordsToAvoid()
   autocmd BufWinLeave *.md,*.tex call clearmatches()
augroup END


" Frequentis specifics
"adds user and timestamp to end of line
nnoremap <F4> :r! echo "(slendl on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>kJ
autocmd BufRead MakePkg setlocal noexpandtab filetype=make
autocmd BufRead ReleaseNotes setlocal textwidth=80 colorcolumn=80 spell

command! TargetOn execute 'set scrolloff=15 | %s/t on="false/t on="true/gc | set scrolloff=5'
command! TargetOff execute 'set scrolloff=15 | %s/t on="true/t on="false/gc | set scrolloff=5'

" vi: ft=vim
