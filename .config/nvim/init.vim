" Plugins {{{
" Init {{{
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
function! VerNewerThen(min, current) "{{{
" return 1 with version $current is newer then version $min
   if has('nvim')
      " neovim makes sth wierd with the string in system()
      return 1
   else
      return system("[  \"".a:min."\" = \"`echo -e \"".a:min."\\n".a:current." | sort -V | head -n1`\" ] && echo 1 || echo 0")
   endif
endfunction "}}}

set nocompatible               " Be iMproved
set runtimepath^=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))
" }}}
NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#install_process_timeout = 1500
NeoBundle 'bchretien/vim-profiler'
NeoBundle 'embear/vim-localvimrc'
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" ReleaseNotes {{{
if !empty(glob("~/.zprofile.frq"))
   NeoBundleLazy 'ReleaseNotes', {
            \ 'external_commands' : 'svn',
            \ 'uri' : 'http://svn.frequentis.frq/components/systemsw/software/dev-env/vim/trunk/Plugin-ReleaseNotes',
            \ 'name' : 'ReleaseNotes',
            \ 'on_ft' : 'ReleaseNotes',
            \ 'disabled' : empty(glob("~/.zprofile.frq")),
            \ 'type' : 'svn'
            \ }
            " \ 'disabled' : !executable('svn'),
endif "}}}
NeoBundle 'kergoth/vim-bitbake'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-airline/vim-airline' "{{{
NeoBundle 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
"}}}
NeoBundle 'mileszs/ack.vim' "{{{
if executable('ag')
   let g:ackprg = 'ag --vimgrep'
endif
" search for current word in project: acording to current dir!!
nnoremap <leader>* :Ack! <c-r><c-w><cr>
" nnoremap <leader>t :Ack! "TODO\|FIXME"<CR>
"}}}
NeoBundle 'mbbill/undotree', { 'on_cmd': 'UndotreeToggle' } " {{{
nnoremap <F5> :UndotreeToggle<cr>
"}}}
" NeoBundle 'ctrlpvim/ctrlp.vim' "{{{
" " open file in new tab with <c-t> = default
" let g:ctrlp_extensions = ['tag']
" nmap <leader><c-p> :CtrlPTag<cr>
"}}}
NeoBundle 'junegunn/fzf', { 'build': './install --all' } "{{{
NeoBundle 'junegunn/fzf.vim'
nnoremap <c-p> :FZF<CR>
"}}}
source $HOME/.config/nvim/unit.vim
NeoBundle 'majutsushi/tagbar'                      " Vim plugin that displays tags in a window, ordered by scope {{{
nnoremap <F6> :TagbarToggle<CR>
"}}}
" NeoBundle 'scrooloose/nerdtree' , { 'on_cmd':  'NERDTreeToggle' } "{{{
" nnoremap <F3> :NERDTreeToggle<CR>
" NeoBundle 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_gui_startup = 0
" let NERDTreeHijackNetrw=1"}}}
" NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tmux-plugins/vim-tmux'                  " vim plugin for tmux.conf
NeoBundle 'tmux-plugins/vim-tmux-focus-events'
NeoBundle 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>

NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
" 'tyru/caw.vim'
NeoBundle 'junegunn/vim-easy-align' "{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
NeoBundle 'chrisbra/vim-diff-enhanced'
" NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive'} " a Git wrapper so awesome, it should be illegal
" NeoBundle 'idanarye/vim-merginal', { 'augroup' : 'fugitive'} " Fugitive extension to manage and merge Git branches
NeoBundle 'lambdalisue/vim-gita'
NeoBundle 'lambdalisue/vim-gista'
" git config github.user {username}
NeoBundle 'lambdalisue/vim-gista-unite', {
    \ 'depends': 'vim-gista',
    \ }

NeoBundle 'mhinz/vim-signify'                      " git diff as signs {{{
autocmd User Fugitive SignifyRefresh
let g:signify_sign_change            = '~'
" let g:signify_update_on_focusgained  = 1
" ignore whitespaces in git
if !exists('g:signify_vcs_cmds')
   let g:signify_vcs_cmds = { 'git': 'git diff --no-color --no-ext-diff -U0 -w -- %f' }
   " let g:signify_vcs_cmds = { 'svn': 'svn diff --diff-cmd %d -x -U0 -- %f' }
endif "}}}
NeoBundle 'juneedahamed/svnj.vim'                  " VIM SVN plugin ( subversion svn vim7) {{{
let g:svnj_custom_statusbar_ops_hide = 1
" Supported operations are listed on the status line of the svnj_window. With growing support for
" many commands, recomend to hide it. You can still have a quick glance of supported operations by
" pressing ? (question-mark)
let g:svnj_browse_cache_all = 1
" This enables caching, Listing of files will be faster, On MAC/Unix the default location is $HOME/.cache.
" A new directory svnj will be created in the specified directory.
"}}}
NeoBundle 'kshenoy/vim-signature'                  " toggle, display and navigate marks {{{
let g:SignatureMarkerTextHLDynamic=1
let g:SignatureMarksTextHLDynamic=1
let g:SignatureEnabledAtStartup=1
" nnoremap mm :ToggleMarkAtLine<CR>
let g:SignatureMap = { 'ToggleMarkAtLine'   :  "mm" }
"}}}
NeoBundle 'will133/vim-dirdiff'
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*~,.svn,.git,*.o"
NeoBundle 'Lokaltog/vim-easymotion' " {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

NeoBundle 'unblevable/quick-scope'
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" NeoBundle 'justinmk/vim-sneak'
" let g:sneak#use_ic_scs = 1
" let g:sneak#streak = 1
" }}}
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundle 'powerman/vim-plugin-AnsiEsc'            " adds support for ansi escape characters - useful for vimpager
NeoBundle 'tpope/vim-surround'
" vimfiler {{{
NeoBundle 'Shougo/neossh.vim' ", {'on_ft': 'vimfiler', 'sources': 'ssh'}
NeoBundle 'Shougo/vimfiler.vim', {
         \ 'depends': 'unite.vim',
         \ }
         " \ 'on_map': [['n', '<Plug>']],
         " \ 'on_if': "isdirectory(bufname('%'))",
         " \ 'hook_post_source': 'source '.$HOME.'.config/nvim/vimfiler.vim'

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
"let g:vimfiler_preview_action = 'auto_preview'

let g:vimfiler_ignore_pattern =
         \ '^\%(\.git\|\.svn|\.idea\|\.DS_Store\|\.vagrant\|\.stversions\|\.tmp'
         \ .'\|node_modules\|.*\.pyc\|.*\.egg-info\|__pycache__\)$'

" call vimfiler#custom#profile('default', 'context', {
         " \  'safe': 0,
         " \  'explorer': 1,
         " \  'winwidth': 25,
         " \  'split': 1,
         " \  'direction': 'topleft',
         " \  'auto_expand': 1,
         " \  'no_quit': 1,
         " \  'force_hide': 1,
         " \  'parent': 0,
         " \  'toggle': 1,
         " \ })
" }}}

" NeoBundle 'terryma/vim-expand-region' "{{{
" map gk <Plug>(expand_region_expand)
" map gj <Plug>(expand_region_shrink)
"}}}
" NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/accelerated-jk'

" CODING Plugins
" Pandoc | Markdown {{{
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc'
let g:pandoc#command#latex_engine = 'pdflatex'
let g:pandoc#command#autoexec_command = 'Pandoc pdf -s'
" let g:pandoc#command#autoexec_on_writes = '1'
augroup filetype_pandoc
    autocmd!
    autocmd FileType pandoc nnoremap <F9> :Pandoc pdf -s --number-sections <CR>
    autocmd FileType pandoc,markdown nnoremap <localleader>aa :autocmd BufWritePost *.pdc :Pandoc pdf -s<CR>

    " enable spelling in markdown and latex
    autocmd FileType markdown,latex,pandoc setlocal spell textwidth=100 colorcolumn=100
    autocmd BufRead *.md,*.tex,*.pdc setlocal spell textwidth=100 colorcolumn=100
augroup END

NeoBundle 'vim-pandoc/vim-pandoc-after'
let g:pandoc#after#modules#enabled = ["unite", "neosnippets"]
" }}}
" LaTeX {{{
NeoBundle 'lervag/vimtex'
let g:tex_flavor = "latex"
let g:tex_conceal = "adgm"
let g:vimtex_fold_enabled = 1
let g:vimtex_format_enabled = 1 " formating with gq considers comments
let g:vimtex_view_method = 'zathura'
" let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_background = 1
let g:vimtex_latexmk_callback = 1
if has('nvim') && executable('nvr')
   let g:vimtex_latexmk_progname = 'nvr'
endif
" }}}
" syntastic {{{
" if has('nvim')
   " Plug 'benekastah/neomake'
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
" else
   " Syntax checking hacks for vim
   NeoBundle 'scrooloose/syntastic'
" endif
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E501,E225'
" }}}
" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box."{{{
" NeoBundle 'klen/python-mode', { 'on_ft': 'python' }
" " set this if compiled with both versions
" if has('pyton3')
   " let g:pymode_python = 'python3'
" endif
" let g:pymode_rope_completion = 1
" let g:pymode_rope_complete_on_dot = 1
" let g:pymode_lint_ignore = "E501"

" augroup python_aug
   " autocmd!
   " autocmd FileType python setlocal textwidth=79 colorcolumn=79
" augroup END

"}}}
NeoBundle 'davidhalter/jedi-vim', {'on_ft': 'python'} " {{{
NeoBundle 'zchee/deoplete-jedi', {'on_ft': 'python', 'on_i': 1}

let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tag_stack = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#max_doc_height = 45
let g:jedi#use_splits_not_buffers = 'bottom'
let g:jedi#completions_command = ''
let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>a'
let g:jedi#documentation_command = 'K'
let g:jedi#rename_command = '<leader>r'
let g:jedi#usages_command = '<leader>n'

if ! has('nvim')
   setlocal completeopt=menuone,longest
   augroup MyAutoCmd
      autocmd FileType python
               \ if has('python') || has('python3') |
               \   setlocal omnifunc=jedi#completions |
               \ else |
               \   setlocal omnifunc= |
               \ endif
   augroup END
endif

"}}}
" Javascript {{{
NeoBundle 'othree/yajs.vim', {'on_ft': 'javascript'}
NeoBundle 'gavocanov/vim-js-indent', {'on_ft': 'javascript'}
NeoBundle 'othree/javascript-libraries-syntax.vim', {'on_ft': 'javascript'}
NeoBundle 'othree/jspc.vim', {'on_ft': 'javascript'}
NeoBundle 'heavenshell/vim-jsdoc', {'on_ft': 'javascript'}
NeoBundle 'moll/vim-node', {'on_ft': 'javascript'}
NeoBundle 'carlitux/deoplete-ternjs', {
         \ 'if': 'executable("tern")',
         \ 'on_ft': 'javascript',
         \ 'on_i': 1
         \ }

" }}}
" NeoBundle 'fatih/vim-go'
" NeoBundle 'garyburd/go-explorer'
NeoBundle 'vim-scripts/gtk-vim-syntax'
NeoBundle 'vivien/vim-linux-coding-style'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/deoplete.nvim', {
   \ 'depends': 'context_filetype.vim',
   \ 'if': 'has("nvim")',
   \ 'on_i': 1,
   \ }
   " \ 'hook_source': 'let g:deoplete#enable_at_startup = 1'
   " \   .' | source '.$HOME.'/.config/nvim/deoplete.vim'
source $HOME/.config/nvim/deoplete.vim
" :UpdateRemotePlugins

" NeoBundle 'Rip-Rip/clang_complete', { 'build': 'make install' } " {{{
" let g:clang_complete_auto = 1
" let g:clang_auto_select = 1
" let g:clang_default_keymappings = 0
" let g:clang_jumpto_declaration_key = "<c-[>"
" let g:clang_use_library = 1
" " " let g:clang_auto_user_options = ".clang_complete"
" " let g:clang_library_path = "/home_vie/slendl/.linuxbrew/lib"
" " ln libclang.so.1 libclang.so
" check out clang completion database.. cmake can produce such a database
" }}}
" " YCM {{{
" let cmake_version = split(system('cmake --version'))
" if executable('cmake') && VerNewerThen("2.8.11", cmake_version[2])
   " " NeoBundle 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.py --clang-completer'}
   " NeoBundleLazy 'Valloric/YouCompleteMe', {
            " \ 'augroup': 'youcompletemeStart',
            " \ 'build' : {
            " \     'mac' : './install.sh --clang-completer',
            " \     'unix' : './install.sh --clang-completer',
            " \     'windows' : './install.sh --clang-completer',
            " \     'cygwin' : './install.sh --clang-complete'
            " \    }
            " \ }
   " augroup load_ycm
      " autocmd!
      " autocmd InsertEnter * call neobundle#source('YouCompleteMe')
               " \| call youcompleteme#Enable() | autocmd! load_ycm
   " augroup END
" endif

" " latex completion from vimtex
" " let g:ycm_semantic_triggers = { 'tex': ['\v\\\a*(ref|cite)\a*([^]]*\])?\{([^}]*,)*[^}]*'] }

" " }}}
" snippets {{{
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neosnippet'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neosnippet-snippets'
"}}}
" NeoBundle 'xolox/vim-easytags', { 'depends' : 'xolox/vim-misc' } "{{{
" set tags=./tags,./TAGS,tags;TAGS;   " make vim look for tags file reverse-recursivly ;)
" let g:easytags_dynamic_files = 1    " make easytags use this file instead of global
" let g:easytags_async = 1            " make easytag update async
" let g:easytags_opts = ['--c-kinds=+defgpstuxm --fields=+iaS --extra=+q']
" let g:easytags_auto_update = 0      " that kills the io in the kernel
" nmap <F8> :UpdateTags<CR>
"}}}
NeoBundle 'Raimondi/delimitMate', {
         \ 'on_i': 1,
         \ }
         " \ 'hook_source': 'let g:delimitMate_expand_cr = 1',
let g:delimitMate_expand_cr = 1

" LucHermitte/lh-brackets {{{
" NeoBundle 'LucHermitte/lh-vim-lib'
" NeoBundle 'LucHermitte/lh-tags'
" NeoBundle 'LucHermitte/lh-dev'
" NeoBundle 'LucHermitte/lh-brackets'
" }}}
call neobundle#end()
filetype plugin indent on
NeoBundleCheck                 " this will conveniently prompt you to install them.
" }}}
" Settings {{{
" automatic reload .vimrc
augroup source_vimrc
    autocmd!
    autocmd! bufwritepost .vimrc source %
    autocmd! bufwritepost init.vim source %
augroup END
set autoread          " Set to auto read when a file is changed from the outside

" Tabs and Indents {{{

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

" }}}
" Searching {{{
" ---------
set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
set infercase
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
" }}}
" General {{{

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

" }}}
" Vim Directories {{{
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

set mouse=a           " Enable mouse in all modes
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

" }}}
" Editor UI Appearance {{{

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

" }}}
" colorization and styles {{{
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
" }}}
" }}}
" key mappings {{{
" let mapleader = "\"  " rebmap the <Leader> key
let mapleader = ","  " rebmap the <Leader> key

inoremap jk <Esc>
inoremap <Esc> <nop>
nnoremap Q <nop>

nmap j <Plug>(accelerated_jk_gj_position)
nmap k <Plug>(accelerated_jk_gk_position)
" noremap <silent> j gj
" noremap <silent> k gk

nnoremap <F7> :call TogleVisibility()<CR>
nnoremap <leader><F7> :set list!<CR>

" split vertically
nnoremap <leader>v :Vex<CR>
" nnoremap <leader>v <C-w>v<C-w>l
" split vertically
nnoremap <leader>s :Sex<CR>
" nnoremap <leader>s <C-w>s

" " split naviagetion
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

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
nnoremap <expr> dp  &diff ? 'dp]czz' : 'dp'
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
:map <F9> :make<CR>

nnoremap <leader>sv :so $MYVIMRC<CR>:e<CR>
nnoremap <leader>ov :tabe $MYVIMRC<CR>
nnoremap <leader>oz :tabe ~/.zshrc<CR>

" Terminal mappings
if has('nvim')
   nnoremap <leader><C-T> :vsp term://zsh<cr>
   tnoremap <Esc> <C-\><C-n>
   tnoremap <C-h> <C-\><C-n><C-w>h
   tnoremap <C-j> <C-\><C-n><C-w>j
   tnoremap <C-k> <C-\><C-n><C-w>k
   tnoremap <C-l> <C-\><C-n><C-w>l
   tnoremap <C-w><C-w> <C-\><C-n><C-w><c-w>
endif

nnoremap <Space>cc <Plug>(gita-commit-open)

" usefull keys from US-Keyboard - maped to German"{{{
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
" }}}
" }}}
" Functions {{{
" Search for selected text, forwards or backwards. first * then n/N ->"{{{
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
"}}}
" Remember cursor position between vim sessions"{{{
autocmd BufReadPost *
         \ if line("'\"") > 0 && line ("'\"") <= line("$") |
         \   exe "normal! g'\"" |
         \ endif
" center buffer around cursor when opening files
autocmd BufRead * normal zz
"}}}
function! CopyMatches(reg) "{{{
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
"}}}
function! TogleVisibility() "{{{
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
endfunction "}}}
" Font Size{{{
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
"}}}
" MyDiff{{{
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
"}}}
" Highlight words to avoid in tech writing"{{{
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
"}}}

" Frequentis specifics {{{
"adds user and timestamp to end of line
nnoremap <F4> :r! echo "(slendl on `date +"\%a \%b \%d \%T \%Z \%Y"`):"<CR>kJ
autocmd BufRead MakePkg setlocal noexpandtab filetype=make
autocmd BufRead ReleaseNotes setlocal textwidth=80 colorcolumn=80 spell

command! TargetOn execute 'set scrolloff=15 | %s/t on="false/t on="true/gc | set scrolloff=5'
command! TargetOff execute 'set scrolloff=15 | %s/t on="true/t on="false/gc | set scrolloff=5'
" }}}
" }}}
