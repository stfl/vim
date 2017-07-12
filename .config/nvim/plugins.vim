
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('haya14busa/dein-command.vim', {'on_cmd': 'Dein'})


" Unite {{{
" call dein#add('Shougo/denite.nvim', {
"          \ 'lazy': 1,
"          \ 'depends': 'neomru.vim',
"          \ 'hook_post_source': 'source $HOME/.config/nvim/unite.vim'
"          \ })

call dein#add('Shougo/unite.vim', {
         \ 'lazy': 1,
         \ 'depends': 'neomru.vim',
         \ 'hook_post_source': 'source $HOME/.config/nvim/unite.vim'
         \ })

" Unit sources
call dein#add('Shougo/neomru.vim', {'on_if': 1})
call dein#add('Shougo/neoyank.vim', {'on_if': 1, 'on_source': 'unite.vim'})
" call dein#add('Shougo/unite-build', {'on_source': 'unite.vim'})
call dein#add('Shougo/unite-outline', {'on_source': 'unite.vim'})
call dein#add('osyo-manga/unite-quickfix', {'on_source': 'unite.vim'})
call dein#add('osyo-manga/unite-filetype', {'on_source': 'unite.vim'})
call dein#add('tacroe/unite-mark', {'on_source': 'unite.vim'})
call dein#add('tsukkee/unite-tag', {'on_source': 'unite.vim'})
call dein#add('Shougo/neossh.vim', {'on_source': 'unite.vim'}) ", {'on_ft': 'vimfiler', 'sources': 'ssh'})
call dein#add('lambdalisue/vim-gista-unite', { 'on_source': 'unite.vim', 'depends': 'vim-gista'})

" }}}
" ReleaseNotes {{{
if !empty(glob("~/.zprofile.frq"))
   call dein#add('$HOME/.local/repos/Plugin-ReleaseNotes/', {
            \ 'name' : 'ReleaseNotes',
            \ 'on_ft' : 'ReleaseNotes',
            \ 'disabled' : empty(glob("~/.zprofile.frq")),
            \ })
endif

"}}}
" Theme | GUI {{{
call dein#add('jeffkreeftmeijer/vim-numbertoggle', {'on_i': 1})

call dein#add('kshenoy/vim-signature', {'on_path': '.*'})

call dein#add('altercation/vim-colors-solarized')

" call dein#add('Yggdroot/indentLine',{
"          \ 'hook_post_source': 'let g:indentLine_char = "┆"'
"          \})

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" call dein#add('edkolev/tmuxline.vim')

call dein#add('junegunn/limelight.vim', {'lazy': 1})
call dein#add('junegunn/goyo.vim', {
         \ 'depends': 'limelight.vim',
         \ 'on_cmd': 'Goyo',
         \ 'hook_add': 'source $HOME/.config/nvim/goyo.vim'
         \ })

call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('christoomey/vim-tmux-navigator')

call dein#add('Konfekt/FastFold', {
         \ 'on_event': 'BufEnter',
         \ 'hook_post_source': 'FastFoldUpdate'
         \ })

" call dein#add('powerman/vim-plugin-AnsiEsc')    " adds support for ansi escape characters - useful for vimpager
" 'on_cmd': 'AnsiEsc',
" }}}
" Utils {{{

call dein#add('mileszs/ack.vim', { 'on_cmd': 'Ack'})

call dein#add('mbbill/undotree', { 'on_cmd': 'UndotreeToggle' })

call dein#add('junegunn/fzf', {
         \ 'build': './install --all',
         \ 'install_process_timeout': '800',
         \ 'on_if': 0,
         \ })
call dein#add('junegunn/fzf.vim') ", {'on_cmd': 'FZF'})

call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})
" call dein#add('xolox/vim-easytags', { 'depends' : 'xolox/vim-misc' })

call dein#add('scrooloose/nerdcommenter') ", {'on_map': {'n': '<Plug>NERDCommenter'}})
" 'tyru/caw.vim'

call dein#add('haya14busa/incsearch.vim', {'on_map': {'n': '<Plug>'}})
call dein#add('haya14busa/vim-asterisk', {'on_map': {'vn': '<Plug>'}})

call dein#add('junegunn/vim-easy-align', {'xn': '<Plug>LiveEasyAlign'})

" call dein#add('dhruvasagar/vim-table-mode', {
"          \ 'on_ft': ['pandoc', 'markdown'],
"          \ 'on_cmd': ['TableModeToggle', 'TableModeEnable', 'Tableize'] }
"          \ )

call dein#add('Raimondi/delimitMate', {
         \ 'on_i': 1,
         \ 'hook_source': 'let g:delimitMate_expand_cr = 1',
         \ })

call dein#add('Shougo/echodoc.vim')

call dein#add('Shougo/vimfiler.vim', {
         \ 'depends': 'unite.vim',
         \ 'hook_post_source': 'source $HOME/.config/nvim/vimfiler.vim'
         \ })

call dein#add('Shougo/vinarise.vim', {'on_cmd': 'Vinarise'})

call dein#add('bchretien/vim-profiler', {'rtp': ''})

call dein#add('embear/vim-localvimrc')

" call dein#add('airblade/vim-rooter', {'on_cmd' : 'Rooter'})

" call dein#add('chiel92/vim-autoformat')
call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})

" }}}
" Version Control {{{
" Git {{{

call dein#add('lambdalisue/vim-gita', {'on_cmd': 'Gita'})
call dein#add('lambdalisue/vim-gista', {'on_cmd': 'Gista'})          " git config github.user {username}
call dein#add('chrisbra/vim-diff-enhanced', {'on_cmd': 'EnhancedDiff'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})
call dein#add('cohama/agit.vim', {'on_cmd': 'Agit'})

" }}}
call dein#add('juneedahamed/svnj.vim')

call dein#add('will133/vim-dirdiff', {'on_cmd': 'DirDiff'})

call dein#add('mhinz/vim-signify', {'on_path': '.*'})

"}}}
" Motions {{{

call dein#add('Lokaltog/vim-easymotion')
" call dein#add('justinmk/vim-sneak')
" let g:sneak#use_ic_scs = 1
" let g:sneak#streak = 1
call dein#add('unblevable/quick-scope', {'on_path': '.*'})

" call dein#add('bkad/CamelCaseMotion', {'on_map': {'nx': '<Plug>CamelCaseMotion'}})

"
call dein#add('tpope/vim-surround')

" call dein#add('terryma/vim-expand-region') "{{{
" map gk <Plug>(expand_region_expand)
" map gj <Plug>(expand_region_shrink)
"}}}
" call dein#add('terryma/vim-multiple-cursors')
" call dein#add('vim-scripts/accelerated-jk')
" }}}

" ------------------------------------
" CODING Plugins
" -----------------------------------
" call dein#add('scrooloose/syntastic')
call dein#add('neomake/neomake', {
         \ 'if': "has('nvim') && empty($VIM_MINIMAL)",
         \ 'on_cmd': 'Neomake'
         \ })

" Pandoc | Markdown | Latex {{{
call dein#add('vim-pandoc/vim-pandoc-syntax', {'on_ft': 'pandoc'})
call dein#add('vim-pandoc/vim-pandoc', {'on_ft': ['pandoc', 'markdown'] })
call dein#add('vim-pandoc/vim-pandoc-after', {
         \ 'on_ft': ['pandoc', 'markdown'],
         \ 'depends': 'vim-pandoc',
         \})
call dein#add('lervag/vimtex', {'on_ft': ['tex','latex','bib']})

call dein#add('ujihisa/neco-look', {
         \ 'if': 'executable("look")',
         \ })
" TODO
" \ 'if': '&spell',
" \ 'on_i': 1,

" }}}
" Python {{{
call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'}) ", 'on_i': 1})
call dein#add('hynek/vim-python-pep8-indent', {'on_ft': 'python'}) ", 'on_i': 1})
" call dein#add('bfredl/nvim-ipy', {'on_ft': 'python'}) ", 'on_i': 1})
" install: pip install --user jupyter_client

" }}}
" Javascript {{{
" call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
" call dein#add('gavocanov/vim-js-indent', {'on_ft': 'javascript'})
" call dein#add('othree/javascript-libraries-syntax.vim', {'on_ft': 'javascript'})
" call dein#add('othree/jspc.vim', {'on_ft': 'javascript'})
" call dein#add('heavenshell/vim-jsdoc', {'on_ft': 'javascript'})
" call dein#add('moll/vim-node', {'on_ft': 'javascript'})
" call dein#add('carlitux/deoplete-ternjs', {
"          \ 'if': 'executable("tern")',
"          \ 'on_ft': 'javascript',
"          \ 'on_i': 1
"          \ })

" }}}
" Go {{{
" call dein#add('fatih/vim-go', {'on_ft': 'go'})
" call dein#add('garyburd/go-explorer', {'on_ft': 'go'})

" }}}
" C / C++ {{{
call dein#add('zchee/deoplete-clang', {
         \ 'depends': 'deoplete.nvim',
         \ 'on_i': 1,
         \ 'on_ft': ['c','cpp','objc','objcpp']
         \ })

" call dein#add('tweekmonster/deoplete-clang2', {
"          \ 'depends': 'deoplete.nvim',
"          \ 'on_i': 1,
"          \ 'on_ft': ['c','cpp','objc','objcpp']
"          \ })

" call dein#add('Valloric/YouCompleteMe', {
"          \ 'on_i': 1,
"          \ 'on_ft': ['c','cpp','objc','objcpp'],
"          \ 'hook_source': 'source $HOME/.config/nvim/ycm.vim',
"          \ })
         " \ 'on_ft': ['c', 'cpp', 'objc', 'objcpp', 'typescript'],
         " \ 'on_i': 1,
         " \ 'build': './install.sh --clang-completer --system-libclang',
         " \ 'lazy': 1,
         " \ 'merged': 0,
         " \ 'frozen': 1,

call dein#add('vim-scripts/Conque-GDB',
          \ {'on_cmd': ['ConqueTerm', 'ConqueTermSplit', 'ConqueTermVSplit', 'ConqueTermTab', 
          \             'ConqueGdb', 'ConqueGdbSplit', 'ConqueGdbVSplit', 'ConqueGdbTab', 
          \             'ConqueGdbExe', 'ConqueGdbBDelete', 'ConqueGdbCommand']
          \ })

call dein#add("mphe/grayout.vim", {
         \ 'on_ft': ['c','cpp','objc','objcpp']
         \ })

call dein#add('vim-scripts/a.vim', {
         \ 'on_ft': ['c', 'cpp']
         \ })

call dein#add('vim-scripts/gtk-vim-syntax', {'on_ft': ['c','gtk']})

call dein#add('lyuts/vim-rtags', {
         \ 'if': "executable('rc')",
         \ 'on_ft': ['c', 'cpp', 'objc']
         \ })
" install https://github.com/Andersbakken/rtags

" call dein#add('vivien/vim-linux-coding-style')

" }}}
" Others {{{
call dein#add('kergoth/vim-bitbake', {'on_ft': 'bitbake'})
" call dein#add('tmux-plugins/vim-tmux', {'on_ft': 'tmux'})
call dein#add('ericpruitt/tmux.vim', { 'rtp': 'vim/',  'on_ft': 'tmux'})
call dein#add('stfl/meson.vim', {'on_ft': 'meson'})
call dein#add('vim-scripts/OMNeTpp4.x-NED-Syntax-file', {'on_ft': 'ned'})

" }}}

" Deoplete {{{
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/deoplete.nvim', {
         \ 'depends': 'context_filetype.vim',
         \ 'if': 'has("nvim")',
         \ 'on_i': 1,
         \ 'hook_source': 'let g:deoplete#enable_at_startup = 1'
         \   .' | source $HOME/.config/nvim/deoplete.vim'
         \ })

call dein#add('Shougo/neoinclude.vim', {'on_if': 1})

" }}}
" snippets {{{
call dein#add('Shougo/neosnippet.vim', {
         \ 'depends': ['neosnippet-snippets', 'context_filetype.vim'],
         \ 'on_event': 'InsertCharPre',
         \ 'on_ft': 'snippet'
         \ })

call dein#add('Shougo/neosnippet-snippets') ", {'rtp': ''})
call dein#add('honza/vim-snippets') " {'rtp': ''})

" }}}
