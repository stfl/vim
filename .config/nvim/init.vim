" Plugins {{{

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" return 1 with version $current is newer then version $min
function! VerNewerThen(min, current)
   if has('nvim')
      " neovim makes sth wierd with the string in system()
      return 1
   else
      return system("[  \"".a:min."\" = \"`echo -e \"".a:min."\\n".a:current." | sort -V | head -n1`\" ] && echo 1 || echo 0")
   endif
endfunction

if &compatible
   set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#install_process_timeout = 1500

silent !ping svn.frequentis.com -c 1 &>/dev/null
if v:shell_error == 0
   NeoBundle 'ReleaseNotes', {
            \ 'external_commands' : 'svn',
            \ 'disabled' : !executable('svn'),
            \ 'uri' : 'http://svn.frequentis.frq/components/systemsw/software/dev-env/vim/trunk/Plugin-ReleaseNotes',
            \ 'name' : 'ReleaseNotes',
            \ 'on_ft' : 'ReleaseNotes',
            \ 'type' : 'svn'
            \ }
endif

NeoBundle 'altercation/vim-colors-solarized'

" zoom into one split windo with <c-w-o>
NeoBundle 'vim-scripts/ZoomWin'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
set noshowmode     " don't show the current mode (not needed with airline)

NeoBundle 'mileszs/ack.vim'
if executable('ag')
   let g:ackprg = 'ag --vimgrep'
endif
" search for current word in project: acording to current dir!!
nnoremap <leader>* :Ack! <c-r><c-w><cr>
nnoremap <leader>t :Ack! "TODO\|FIXME"<CR>

NeoBundle 'mbbill/undotree', { 'on_cmd': 'UndotreeToggle' }
if has("persistent_undo")
   set undodir=~/.vim/undodir
   set undofile
endif
nnoremap <F5> :UndotreeToggle<cr>

" Fuzzy file, buffer, mru, tag, etc finder.  http://kien.github.com/ctrlp.vim
" NeoBundle 'ctrlpvim/ctrlp.vim'
" " open file in new tab with <c-t> = default
" let g:ctrlp_extensions = ['tag']
" nmap <leader><c-p> :CtrlPTag<cr>

NeoBundle 'junegunn/fzf', { 'build': './install --all' }
NeoBundle 'junegunn/fzf.vim'
nnoremap <c-p> :FZF<CR>

source ~/.config/nvim/unit.vim

" Vim plugin that displays tags in a window, ordered by scope
NeoBundle 'majutsushi/tagbar'
nnoremap <F6> :TagbarToggle<CR>

NeoBundle 'scrooloose/nerdtree' , { 'on_cmd':  'NERDTreeToggle' }
nnoremap <F3> :NERDTreeToggle<CR>
" NeoBundle 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_gui_startup = 0
" let NERDTreeHijackNetrw=1

" NeoBundle 'tpope/vim-vinegar'

" vim plugin for tmux.conf
NeoBundle 'tmux-plugins/vim-tmux'

NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1

NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

NeoBundle 'chrisbra/vim-diff-enhanced'

" a Git wrapper so awesome, it should be illegal
" http://www.vim.org/scripts/script.php?script_id=2975
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive'}

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
" NeoBundle 'airblade/vim-gitgutter', { 'on_cmd': 'GitGutterToggle' }
" let g:gitgutter_enabled = 0 " default off

" git diff as signs
NeoBundle 'mhinz/vim-signify'
autocmd User Fugitive SignifyRefresh

" VIM SVN plugin ( subversion svn vim7)
NeoBundle 'juneedahamed/svnj.vim'
let g:svnj_custom_statusbar_ops_hide = 1
" Supported operations are listed on the status line of the svnj_window. With growing support for
" many commands, recomend to hide it. You can still have a quick glance of supported operations by
" pressing ? (question-mark)
let g:svnj_browse_cache_all = 1
" This enables caching, Listing of files will be faster, On MAC/Unix the default location is $HOME/.cache.
" A new directory svnj will be created in the specified directory.


" NeoBundle to toggle, display and navigate marks
" let g:SignatureMarkerTextHLDynamic=1
" let g:SignatureMarksTextHLDynamic=1
" NeoBundle 'kshenoy/vim-signature'
" let g:SignatureEnabledAtStartup=1

NeoBundle 'will133/vim-dirdiff'
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*~,.svn,.git,*.o"

NeoBundle 'Lokaltog/vim-easymotion' " {{{

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
" }}}

NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'

" adds support for ansi escape characters - useful for vimpager
NeoBundle 'powerman/vim-plugin-AnsiEsc'

NeoBundle 'tpope/vim-surround'

" }}}
" CODING Plugins {{{

" Pandoc | Markdown {{{

NeoBundle 'vim-pandoc/vim-pandoc', { 'on_ft' : 'markdown' }
NeoBundle 'vim-pandoc/vim-pandoc-syntax', { 'on_ft' : 'markdown' }
NeoBundle 'vim-pandoc/vim-pandoc-after', { 'on_ft' : 'markdown' }
let g:pandoc#after#modules#enabled = ["unite", "neosnippets"]

" LaTeX
NeoBundle 'lervag/vimtex' ", { 'on_ft' : 'latex' }
let g:tex_flavor = "latex"
let g:tex_conceal = "adgm"
let g:vimtex_fold_enabled = 1
if has('nvim') && executable('nvr')
   let g:vimtex_latexmk_progname = 'nvr'
endif

" }}}

" if has('nvim')
   " Plug 'benekastah/neomake' " {{{
   " let g:neomake_logfile = resolve(expand("~/.vim/tmp/neomake.log"))
   " let g:neomake_verbose = 2
   " " let g:args = ['-fsyntax-only', '-Wall', '-Wextra']
   " " call extend(g:args, split(system("pkg-config --cflags --libs gstreamer-1.0")))
   " " let g:neomake_c_cpp_maker = {
            " " \ 'args': g:args,
            " " \ 'errorformat':
            " " \ '%-G%f:%s:,' .
            " " \ '%-G%f:%l: %#error: %#(Each undeclared identifier is reported only%.%#,' .
            " " \ '%-G%f:%l: %#error: %#for each function it appears%.%#,' .
            " " \ '%-GIn file included%.%#,' .
            " " \ '%-G %#from %f:%l\,,' .
            " " \ '%f:%l:%c: %trror: %m,' .
            " " \ '%f:%l:%c: %tarning: %m,' .
            " " \ '%f:%l:%c: %m,' .
            " " \ '%f:%l: %trror: %m,' .
            " " \ '%f:%l: %tarning: %m,'.
            " " \ '%f:%l: %m',
            " " \ }
   " " let g:neomake_c_enabled_makers = ['cpp']
" else }}}
   " Syntax checking hacks for vim
   NeoBundle 'scrooloose/syntastic'
" endif

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box."{{{
NeoBundle 'klen/python-mode', { 'on_ft': 'python' }
" set this if compiled with both versions
" let g:pymode_python = 'python3'"}}}

NeoBundle 'fatih/vim-go'
NeoBundle 'garyburd/go-explorer'

NeoBundle 'vim-scripts/gtk-vim-syntax'

" Plug 'Rip-Rip/clang_complete', { 'do': 'make install' } " {{{
" let g:clang_complete_auto = 1
" let g:clang_auto_select = 1
" let g:clang_default_keymappings = 0
" "let g:clang_use_library = 1
" " let g:clang_library_path='/usr/lib/x86_64-linux-gnu'
" " ln libclang.so.1 libclang.so

" if has('nvim') && has("python3")
   " " " sudo pip3 install neovim
   " Plug 'Shougo/deoplete.nvim' " , { 'on': 'DeopleteEnable' }
   " " " :UpdateRemotePlugins
   " let g:deoplete#enable_at_startup = 1   "enable deoplete at vim startup
   " let g:deoplete#enable_ignore_case = 1  "let matcher ignore case
   " let g:deoplete#enable_smart_case = 1   "smart case
   " " let g:deoplete#enable_fuzzy_completion = 1   "fuzzy match
   " let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})  "get default patterns where need to autocomplete
   " " inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
   " " inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
" endif
" elseif version >= 703 && has('lua') {{{
   " Plug 'Shougo/neocomplete.vim' " , { 'on': 'NeoCompleteEnable' }

   " let g:neocomplete#enable_at_startup = 1
   " " Use smartcase.
   " let g:neocomplete#enable_smart_case = 1
   " " Set minimum syntax keyword length.
   " let g:neocomplete#sources#syntax#min_keyword_length = 3
   " let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

   " " Define dictionary.
   " let g:neocomplete#sources#dictionary#dictionaries = {
            " \ 'default' : ''
            " \ }

   " " Define keyword.
   " if !exists('g:neocomplete#keyword_patterns')
      " let g:neocomplete#keyword_patterns = {}
   " endif
   " let g:neocomplete#keyword_patterns['default'] = '\h\w*'

   " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
   " " <C-h>, <BS>: close popup and delete backword char.
   " inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
   " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

   " " Enable heavy omni completion.
   " if !exists('g:neocomplete#sources#omni#input_patterns')
      " let g:neocomplete#sources#omni#input_patterns = {}
   " endif
   " let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
   " let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" endif }}} }}}

" YCM {{{
let cmake_version = split(system('cmake --version'))
if executable('cmake') && VerNewerThen("2.8.11", cmake_version[2])
   " NeoBundle 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.py --clang-completer'}
   NeoBundleLazy 'Valloric/YouCompleteMe', {
            \ 'augroup': 'youcompletemeStart',
            \ 'build' : {
            \     'mac' : './install.sh --clang-completer',
            \     'unix' : './install.sh --clang-completer',
            \     'windows' : './install.sh --clang-completer',
            \     'cygwin' : './install.sh --clang-complete'
            \    }
            \ }
   augroup load_ycm
      autocmd!
      autocmd InsertEnter * call neobundle#source('YouCompleteMe')
               \| call youcompleteme#Enable() | autocmd! load_ycm
   augroup END
endif

" latex completion from vimtex
let g:ycm_semantic_triggers = { 'tex': ['\v\\\a*(ref|cite)\a*([^]]*\])?\{([^}]*,)*[^}]*'] }

" NeoBundle 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<c-k>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" }}}

NeoBundle 'Shougo/neoinclude.vim' " {{{
NeoBundle 'Shougo/neosnippet'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target) "}}}

NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'xolox/vim-easytags', { 'depends' : 'xolox/vim-misc' } "{{{
set tags=./tags,./TAGS,tags;TAGS;   " make vim look for tags file reverse-recursivly ;)
let g:easytags_dynamic_files = 1    " make easytags use this file instead of global
let g:easytags_async = 1            " make easytag update async
let g:easytags_opts = ['--c-kinds=+defgpstuxm --fields=+iaS --extra=+q']
nmap <F8> :UpdateTags<CR> "}}}

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if has('nvim')
   NeoBundleCheck
endif
" }}}

" Settings {{{
" automatic reload .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost init.vim source %
set autoread          " Set to auto read when a file is changed from the outside

" format
" set autoindent
set copyindent " Copy the indentation of the previous line if autoindent doesn't know what to do (it's an eval, actually).
set smartindent
set expandtab  " tab expansion
set textwidth=80
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
" set encoding=utf-8    " Set utf-8 as standard encoding
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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
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
set timeoutlen=1000
set ttimeoutlen=10  " timeout leaving Insert

" show whitespaces
set list
set listchars=tab:»\ ,eol:¬,trail:·,extends:>,precedes:<
nnoremap <F7> :call TogleVisibility()<CR>
nnoremap <leader><F7> :set list!<CR>

" allow folding at markers
set foldmethod=marker
set foldcolumn=1

" vimdiff stuff
" ignore whitespace
set diffopt=filler,vertical,iwhite

" Enable omni completion.
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" enable spelling in markdown and latex
autocmd FileType markdown,latex setlocal spell textwidth=100 colorcolumn=100
autocmd BufRead *.md,*.tex setlocal spell textwidth=100 colorcolumn=100

" Unite config{{{
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

" let g:unite_source_menu_menus.git = {
    " \ 'description' : '            gestionar repositorios git
        " \                            ⌘ [espacio]g',
    " \}
" let g:unite_source_menu_menus.git.command_candidates = [
    " \['▷ tig                                                        ⌘ ,gt',
        " \'normal ,gt'],
    " \['▷ git status       (Fugitive)                                ⌘ ,gs',
        " \'Gstatus'],
    " \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        " \'Gdiff'],
    " \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        " \'Gcommit'],
    " \['▷ git log          (Fugitive)                                ⌘ ,gl',
        " \'exe "silent Glog | Unite quickfix"'],
    " \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        " \'Gblame'],
    " \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        " \'Gwrite'],
    " \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        " \'Gread'],
    " \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        " \'Gremove'],
    " \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        " \'exe "Gmove " input("destino: ")'],
    " \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        " \'Git! push'],
    " \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        " \'Git! pull'],
    " \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        " \'exe "Git! " input("comando git: ")'],
    " \['▷ git cd           (Fugitive)',
        " \'Gcd'],
    " \]
" nnoremap <leader>g :Unite -silent -start-insert menu:git<CR>

" }}}

" }}}

" colorization and styles {{{
let g:solarized_contrast = "high"
" let g:solarized_diffmode = "high"
let g:solarized_visibility = "low"
highlight SignColumn guibg=#131313
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
" let mapleader = "\"  " rebmap the <Leader> key
let mapleader = ","  " rebmap the <Leader> key

inoremap jk <Esc>
inoremap <Esc> <nop>
nnoremap Q <nop>

noremap <silent> j gj
noremap <silent> k gk

" nnoremap ; :
" nnoremap : ;

" split vertically
nnoremap <leader>v :Vex<CR>
" nnoremap <leader>v <C-w>v<C-w>l
" split vertically
nnoremap <leader>s :Sex<CR>
" nnoremap <leader>s <C-w>s

" split naviagetion
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

nnoremap ZAQ :qa!<CR>
nnoremap ZAZ :wqa<CR>

" map Ctrl - Y to save file
nnoremap <silent> <C-y> :update<CR>
vnoremap <C-Y> <Esc>:update<CR>
inoremap <C-Y> <Esc>:update<CR>

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" map Ctrl-M to remove highlight from last search
noremap <C-m> :nohl<CR>
noremap <ESC> :nohl<CR>
" maps <CR> to :nohl in vim - TODO

" map the F9 key to run make
:map <f9> :make<CR>

nnoremap <leader>ov :tabe $MYVIMRC<CR>
nnoremap <leader>oz :tabe ~/.zshrc<CR>

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
autocmd FileType markdown,latex call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md,*.tex call MatchTechWordsToAvoid()
autocmd InsertEnter *.md,*.tex call MatchTechWordsToAvoid()
autocmd InsertLeave *.md,*.tex call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md,*.tex call clearmatches()

" }}}

" Frequentis specifics {{{

"adds user and timestamp to end of line
nmap <F4> :r! echo "(slendl on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>k J
autocmd BufRead MakePkg setlocal noexpandtab filetype=make

command! TargetOn execute 'set scrolloff=15 | %s/t on="false/t on="true/gc | set scrolloff=5'
command! TargetOff execute 'set scrolloff=15 | %s/t on="true/t on="false/gc | set scrolloff=15'



" }}}

