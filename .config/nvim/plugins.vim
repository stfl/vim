call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('bchretien/vim-profiler', {'rtp': ''})

call dein#add('embear/vim-localvimrc')
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

call dein#add('tmux-plugins/vim-tmux-focus-events', {'if': "$TMUX != ''"})
call dein#add('christoomey/vim-tmux-navigator', {
         \ 'if': "$TMUX != ''",
         \ 'hook_post_source': 'let g:tmux_navigator_no_mappings = 1'
         \ })

" Unite {{{
call dein#add('Shougo/unite.vim', {
         \ 'lazy': 1,
         \ 'depends': 'neomru.vim',
         \ 'hook_post_source': 'source $HOME/.config/nvim/unite.vim'
         \ })

" Unit sources
call dein#add('Shougo/neomru.vim', {'on_if': 1})
call dein#add('Shougo/neoyank.vim', {'on_if': 1, 'on_source': 'unite.vim'})
call dein#add('Shougo/unite-build', {'on_source': 'unite.vim'})
call dein#add('Shougo/unite-outline', {'on_source': 'unite.vim'})
call dein#add('osyo-manga/unite-quickfix', {'on_source': 'unite.vim'})
call dein#add('osyo-manga/unite-filetype', {'on_source': 'unite.vim'})
call dein#add('tacroe/unite-mark', {'on_source': 'unite.vim'})
call dein#add('tsukkee/unite-tag', {'on_source': 'unite.vim'})
call dein#add('Shougo/neossh.vim', {'on_ft': 'vimfiler', 'sources': 'ssh'})
call dein#add('lambdalisue/vim-gista-unite', { 'on_source': 'unite.vim', 'depends': 'vim-gista'})
" }}}

" ReleaseNotes {{{
" if !empty(glob("~/.zprofile.frq"))
"    call dein#add('ReleaseNotes', {
"             \ 'external_commands' : 'svn',
"             \ 'uri' : 'http://svn.frequentis.frq/components/systemsw/software/dev-env/vim/trunk/Plugin-ReleaseNotes',
"             \ 'name' : 'ReleaseNotes',
"             \ 'on_ft' : 'ReleaseNotes',
"             \ 'disabled' : empty(glob("~/.zprofile.frq")),
"             \ 'type' : 'svn'
"             \ })
"             " \ 'disabled' : !executable('svn'),
" endif "}}}

call dein#add('Shougo/vinarise.vim', {'on_cmd': 'Vinarise'})
call dein#add('Konfekt/FastFold', {
         \ 'on_event': 'BufEnter',
         \ 'hook_post_source': 'FastFoldUpdate'
         \ })

" Theme | GUI {{{
call dein#add('jeffkreeftmeijer/vim-numbertoggle', {'on_i': 1})
call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-airline/vim-airline', {'on_if': 1})
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" fixes unneccessary redraw, when e.g. opening Gundo window
let airline#extensions#tabline#ignore_bufadd_pat =
            \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0

call dein#add('vim-airline/vim-airline-themes', {'on_source': 'vim-airline'})
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" create a Tmuxline with airline colors
" call dein#add('edkolev/tmuxline.vim', {
"          \ 'on_cmd' : 'Tmuxline'
"          \ })
" if dein#tap('tmuxline.vim')
"    let g:tmuxline_preset = {
"             \'a'       : '#S',
"             \'b'       : '#F',
"             \'win'     : '#I #W',
"             \'cwin'    : ['#I', '#W'],
"             \'x'       : ['#(tmux-mem-cpu-load --interval 2)', 'Cont: \#{continuum_status}', '%a'],
"             \'y'       : ['%d. %h', '%H:%M'],
"             \'z'       : '#H',
"             \'options' : {'status-justify' : 'left'}}
"    call dein#untap()
" endif
" }}}

" Filetypes
call dein#add('kergoth/vim-bitbake', {'on_ft': 'bitbake'})
call dein#add('tmux-plugins/vim-tmux', {'on_ft': 'tmux'})           " vim plugin for tmux.conf

call dein#add('mileszs/ack.vim', {
         \ 'on_cmd': 'Ack',
         \})
         " \ 'if': "executable('ag') || executable('ack')"
         " \ 'on_cmd': 'AckFromSearch',

if executable('ag')
   let g:ackprg = 'ag --vimgrep'
endif
" search for current word in project: acording to current dir!!
nnoremap <leader>* :Ack! <c-r><c-w><cr>

"}}}
call dein#add('mbbill/undotree', { 'on_cmd': 'UndotreeToggle' }) " {{{
nnoremap <F5> :UndotreeToggle<cr>
"}}}

" FZF {{{
call dein#add('junegunn/fzf', {
         \ 'build': './install --all',
         \ 'install_process_timeout': '800',
         \ })
         " \ 'rtp': ''
call dein#add('junegunn/fzf.vim', {'on_cmd': 'FZF'})
nnoremap <c-p> :FZF<CR>
"}}}
call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})                      " Vim plugin that displays tags in a window, ordered by scope {{{
nnoremap <F6> :TagbarToggle<CR>
"}}}
" tmux {{{

" }}}
call dein#add('scrooloose/nerdcommenter') ", {'on_map': {'n': '<Plug>NERDCommenter'}})
let NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" 'tyru/caw.vim'

call dein#add('haya14busa/incsearch.vim', {'on_map': {'n': '<Plug>'}})
call dein#add('junegunn/vim-easy-align', {'xn': '<Plug>LiveEasyAlign'})
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(LiveEasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

call dein#add('chrisbra/vim-diff-enhanced', {'on_cmd': 'EnhancedDiff'})
" call dein#add('tpope/vim-fugitive', { 'augroup' : 'fugitive'}) " a Git wrapper so awesome, it should be illegal
" call dein#add('idanarye/vim-merginal', { 'augroup' : 'fugitive'}) " Fugitive extension to manage and merge Git branches
call dein#add('lambdalisue/vim-gita', {'on_cmd': 'Gita'})
call dein#add('lambdalisue/vim-gista', {'on_cmd': 'Gista'})
" git config github.user {username}

call dein#add('mhinz/vim-signify', {'on_path': '.*'})                      " git diff as signs {{{
autocmd User Fugitive SignifyRefresh
let g:signify_sign_change            = '~'
" let g:signify_update_on_focusgained  = 1
" ignore whitespaces in git
if !exists('g:signify_vcs_cmds')
   let g:signify_vcs_cmds = { 'git': 'git diff --no-color --no-ext-diff -U0 -w -- %f' }
   " let g:signify_vcs_cmds = { 'svn': 'svn diff --diff-cmd %d -x -U0 -- %f' }
endif "}}}

call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})

call dein#add('juneedahamed/svnj.vim')                  " VIM SVN plugin ( subversion svn vim7) {{{
let g:svnj_custom_statusbar_ops_hide = 1
" Supported operations are listed on the status line of the svnj_window. With growing support for
" many commands, recomend to hide it. You can still have a quick glance of supported operations by
" pressing ? (question-mark)
let g:svnj_browse_cache_all = 1
" This enables caching, Listing of files will be faster, On MAC/Unix the default location is $HOME/.cache.
" A new directory svnj will be created in the specified directory.
"}}}
"
call dein#add('kshenoy/vim-signature', {'on_path': '.*'}) " toggle, display and navigate marks {{{
let g:SignatureMarkerTextHLDynamic=1
let g:SignatureMarksTextHLDynamic=1
let g:SignatureEnabledAtStartup=1
" nnoremap mm :ToggleMarkAtLine<CR>
let g:SignatureMap = { 'ToggleMarkAtLine'   :  "mm" }
"}}}

call dein#add('will133/vim-dirdiff', {'on_cmd': 'DirDiff'})
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*~,.svn,.git,*.o"

call dein#add('Lokaltog/vim-easymotion') " {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

call dein#add('unblevable/quick-scope', {'on_path': '.*'})
nmap <leader>q <Plug>(QuickScopeToggle)
vmap <leader>q <Plug>(QuickScopeToggle)
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

call dein#add('bkad/CamelCaseMotion', {'on_map': {'nx': '<Plug>CamelCaseMotion'}})

" call dein#add('justinmk/vim-sneak')
" let g:sneak#use_ic_scs = 1
" let g:sneak#streak = 1
" }}}
" call dein#add('powerman/vim-plugin-AnsiEsc')            " adds support for ansi escape characters - useful for vimpager
call dein#add('tpope/vim-surround')
call dein#add('Shougo/echodoc.vim')

" VimFiler {{{
call dein#add('Shougo/vimfiler.vim', {
         \ 'depends': 'unite.vim',
         \ 'hook_post_source': 'source $HOME/.config/nvim/vimfiler.vim'
         \ })
         " \ 'on_map': [['n', '<Plug>']],
         " \ 'on_if': "isdirectory(bufname('%'))",
" $HOME/.config/nvim/vimfiler.vim
" if dein#tap('vimfiler.vim')
"    let dein#hooks.on_source = $HOME.'/.config/nvim/vimfiler.vim'
"    call dein#untap()
" endif
" }}}

" call dein#add('terryma/vim-expand-region') "{{{
" map gk <Plug>(expand_region_expand)
" map gj <Plug>(expand_region_shrink)
"}}}
" call dein#add('terryma/vim-multiple-cursors')
call dein#add('vim-scripts/accelerated-jk')

" CODING Plugins
" Pandoc | Markdown {{{
call dein#add('vim-pandoc/vim-pandoc-syntax', {'on_ft': 'pandoc'})
call dein#add('vim-pandoc/vim-pandoc', {'on_ft': 'pandoc,markdown'})
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

call dein#add('vim-pandoc/vim-pandoc-after', {'on_ft': 'pandoc'})
let g:pandoc#after#modules#enabled = ["unite", "neosnippets"]
" }}}
" LaTeX {{{
call dein#add('lervag/vimtex', {'on_ft': 'tex,latex,bib'})
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
call dein#add('scrooloose/syntastic')
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E501,E225'
" }}}

"}}}
call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'}) " {{{
call dein#add('zchee/deoplete-jedi', {'on_ft': 'python', 'on_i': 1})

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
   autocmd MyAutoCmd FileType python
            \ if has('python') || has('python3') |
            \   setlocal omnifunc=jedi#completions |
            \ else |
            \   setlocal omnifunc= |
            \ endif
endif

"}}}
" Javascript {{{
call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
call dein#add('gavocanov/vim-js-indent', {'on_ft': 'javascript'})
call dein#add('othree/javascript-libraries-syntax.vim', {'on_ft': 'javascript'})
call dein#add('othree/jspc.vim', {'on_ft': 'javascript'})
call dein#add('heavenshell/vim-jsdoc', {'on_ft': 'javascript'})
call dein#add('moll/vim-node', {'on_ft': 'javascript'})
call dein#add('carlitux/deoplete-ternjs', {
         \ 'if': 'executable("tern")',
         \ 'on_ft': 'javascript',
         \ 'on_i': 1
         \ })

" }}}
" call dein#add('fatih/vim-go')
" call dein#add('garyburd/go-explorer')
call dein#add('vim-scripts/gtk-vim-syntax', {'on_ft': 'c,gtk'})
call dein#add('vivien/vim-linux-coding-style')

call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/deoplete.nvim', {
         \ 'depends': 'context_filetype.vim',
         \ 'if': 'has("nvim")',
         \ 'on_i': 1,
         \ 'hook_source': 'let g:deoplete#enable_at_startup = 1'
         \   .' | source $HOME/.config/nvim/deoplete.vim'
         \ })

call dein#add('zchee/deoplete-clang', {
         \ 'depends': 'deoplete.nvim',
         \ 'on_i': 1,
         \ 'on_ft': 'c,cpp,objc,objcpp'
         \ })

" sudo find /usr/ -name libclang.so
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.5/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.5/'

" " }}}
" snippets {{{
call dein#add('Shougo/neoinclude.vim', {'on_if': 1})
call dein#add('Shougo/neosnippet', {
         \ 'depends': ['neosnippet-snippets', 'context_filetype.vim'],
         \ 'on_event': 'InsertCharPre',
         \ 'on_ft': 'snippet'
         \ })
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

call dein#add('honza/vim-snippets', {'rtp': ''})
call dein#add('Shougo/neosnippet-snippets')

" call dein#add('xolox/vim-easytags', { 'depends' : 'xolox/vim-misc' }) "{{{
" set tags=./tags,./TAGS,tags;TAGS;   " make vim look for tags file reverse-recursivly ;)
" let g:easytags_dynamic_files = 1    " make easytags use this file instead of global
" let g:easytags_async = 1            " make easytag update async
" let g:easytags_opts = ['--c-kinds=+defgpstuxm --fields=+iaS --extra=+q']
" let g:easytags_auto_update = 0      " that kills the io in the kernel
" nmap <F8> :UpdateTags<CR>

call dein#add('Raimondi/delimitMate', {
         \ 'on_i': 1,
         \ 'hook_source': 'let g:delimitMate_expand_cr = 1',
         \ })
