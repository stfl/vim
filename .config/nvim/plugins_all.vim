" -----------
" Plugin specific config
" -----------

if dein#tap('vim-localvimrc')
   let g:localvimrc_ask = 0
   let g:localvimrc_sandbox = 0
endif

if dein#tap('vim-tmux-navigator')
   let g:tmux_navigator_no_mappings = 1
   "unmap <A-h>
   "unmap <A-j>
   "unmap <A-k>
   "unmap <A-l>
   nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
   nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
   nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
   nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
   " nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
endif

if dein#tap('vim-airline') "{{{
   let g:airline#extensions#tabline#enabled = 1
   let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
   let g:airline#extensions#tabline#show_tab_nr = 0
   let g:airline#extensions#tabline#show_tab_type = 0
   let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
   " fixes unneccessary redraw, when e.g. opening Gundo window
   let airline#extensions#tabline#ignore_bufadd_pat =
            \ '\c\vgundo|undotree|diffpanel|vimfiler|tagbar|nerd_tree|[unite]|vimfiler'
   " let g:airline#extensions#tabline#fnamemod = ':t'
   let g:airline#extensions#tabline#show_splits = 0
endif

if dein#tap('vim-airline-themes')
   let g:airline_powerline_fonts = 1
   let g:airline_theme='solarized'
endif

if dein#tap('tmuxline.vim')
   let g:tmuxline_preset = {
            \'a'       : '#S',
            \'b'       : '#F',
            \'win'     : '#I #W',
            \'cwin'    : ['#I', '#W'],
            \'x'       : ['#(tmux-mem-cpu-load --interval 2)', 'Cont: \#{continuum_status}', '%a'],
            \'y'       : ['%d. %h', '%H:%M'],
            \'z'       : '#H',
            \'options' : {'status-justify' : 'left'}}
   call dein#untap()
endif

" }}}
"
if dein#tap('ack.vim')
   if executable('ag')
      let g:ackprg = 'ag --vimgrep'
   endif
   " search for current word in project: acording to current dir!!
   nnoremap <leader>* :Ack! <c-r><c-w><cr>
endif

if dein#tap('undotree')
   nnoremap <Leader>gu  :UndotreeToggle<CR>
   nnoremap <F5> :UndotreeToggle<cr>
endif

if dein#tap('fzf.vim')
   nnoremap <c-p> :FZF<CR>
endif

if dein#tap('tagbar')
   nnoremap <F6> :TagbarToggle<CR>
endif

if dein#tap('nerdcommenter')
   let NERDSpaceDelims=1
   let g:NERDDefaultAlign = 'left'
   let g:NERDCommentEmptyLines = 1
   let g:NERDTrimTrailingWhitespace = 1
endif

if dein#tap('vim-easy-align')
   " Start interactive EasyAlign in visual mode (e.g. vipga)
   xmap ga <Plug>(LiveEasyAlign)
   " " Start interactive EasyAlign for a motion/text object (e.g. gaip)
   nmap ga <Plug>(LiveEasyAlign)
endif

if dein#tap('vim-signify')
   autocmd MyAutoCmd User Fugitive SignifyRefresh
   let g:signify_sign_change            = '~'
   " let g:signify_update_on_focusgained  = 1
   " ignore whitespaces in git
   if !exists('g:signify_vcs_cmds')
      let g:signify_vcs_cmds = { 'git': 'git diff --no-color --no-ext-diff -U0 -w -- %f' }
      " let g:signify_vcs_cmds = { 'svn': 'svn diff --diff-cmd %d -x -U0 -- %f' }
   endif
endif

if dein#tap('svnj.vim')
   let g:svnj_custom_statusbar_ops_hide = 1
   " Supported operations are listed on the status line of the svnj_window. With growing support for
   " many commands, recomend to hide it. You can still have a quick glance of supported operations by
   " pressing ? (question-mark)
   let g:svnj_browse_cache_all = 1
   " This enables caching, Listing of files will be faster, On MAC/Unix the default location is $HOME/.cache.
   " A new directory svnj will be created in the specified directory.
endif

if dein#tap('vim-diffdiff')
   let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*~,.svn,.git,*.o"
endif

if dein#tap('vim-signature')
   let g:SignatureMarkerTextHLDynamic=1
   let g:SignatureMarksTextHLDynamic=1
   let g:SignatureEnabledAtStartup=1
   " nnoremap mm :ToggleMarkAtLine<CR>
   let g:SignatureMap = { 'ToggleMarkAtLine'   :  "mm" }
endif

if dein#tap('vim-easymotion')
   let g:EasyMotion_do_mapping = 0
   let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
   let g:EasyMotion_smartcase = 1
   nmap s <Plug>(easymotion-s2)
   map <leader>j <Plug>(easymotion-j)
   map <leader>k <Plug>(easymotion-k)
endif

if dein#tap('quick-scope')
   nmap <leader>q <Plug>(QuickScopeToggle)
   vmap <leader>q <Plug>(QuickScopeToggle)
   " let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
endif

if dein#tap('accelerated-jk')
   " nmap j <Plug>(accelerated_jk_gj_position)
   " nmap k <Plug>(accelerated_jk_gk_position)
   nmap j <Plug>(accelerated_jk_gj)
   nmap k <Plug>(accelerated_jk_gk)
endif

if dein#tap('CamelCaseMotion')
   map <silent> w <Plug>CamelCaseMotion_w
   map <silent> b <Plug>CamelCaseMotion_b
   map <silent> e <Plug>CamelCaseMotion_e
   map <silent> ge <Plug>CamelCaseMotion_ge
   sunmap w
   sunmap b
   sunmap e
   sunmap ge

   " omap <silent> iw <Plug>CamelCaseMotion_iw
   " xmap <silent> iw <Plug>CamelCaseMotion_iw
   " omap <silent> ib <Plug>CamelCaseMotion_ib
   " xmap <silent> ib <Plug>CamelCaseMotion_ib
   " omap <silent> ie <Plug>CamelCaseMotion_ie
   " xmap <silent> ie <Plug>CamelCaseMotion_ie
endif

if dein#tap('incsearch.vim')
   set hlsearch
   let g:incsearch#auto_nohlsearch = 1

   map /   <Plug>(incsearch-forward)
   map ?   <Plug>(incsearch-backward)
   map g/  <Plug>(incsearch-stay)

   map n   <Plug>(incsearch-nohl-n)
   map N   <Plug>(incsearch-nohl-N)

   map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
   map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
   map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
   map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)

   map z*  <Plug>(asterisk-z*)
   map gz* <Plug>(asterisk-gz*)
   map z#  <Plug>(asterisk-z#)
   map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-asterisk')
   " let g:asterisk#keeppos = 1
endif

if dein#tap('vim-pandoc')
   let g:pandoc#command#autoexec_command = 'Pandoc pdf -s'
   let g:pandoc#formatting#textwidth = 100
   let g:pandoc#command#use_message_buffers = '0'
   " let g:pandoc#completion#bib#mode = 'citeproc'

   " toggle autoexec
   autocmd MyAutoCmd FileType pandoc,markdown nnoremap <localleader>aa
      \ :let g:pandoc#command#autoexec_on_writes = g:pandoc#command#autoexec_on_writes == 1 ? 0 : 1<CR>
      \ :echomsg "Pandoc autoexec " . string(g:pandoc#command#autoexec_on_writes == 0 ? "deactivated" : "activated")<CR>
endif

if dein#tap('vim-pandoc-after')
   let g:pandoc#after#modules#enabled = ["unite", "neosnippets"]
endif

if dein#tap('vimtex')
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
endif

if dein#tap('jedi-vim')
   let g:jedi#force_py_version = 3
   let g:jedi#completions_enabled = 0
   let g:jedi#auto_vim_configuration = 0
   let g:jedi#smart_auto_mappings = 0
   let g:jedi#use_tag_stack = 0
   let g:jedi#popup_select_first = 0
   let g:jedi#popup_on_dot = 0
   let g:jedi#show_call_signatures = 0
   let g:jedi#max_doc_height = 30
   let g:jedi#use_splits_not_buffers = 'right'
   let g:jedi#completions_command = ''
   let g:jedi#goto_command = '<leader>d'
   let g:jedi#goto_assignments_command = '<leader>a'
   let g:jedi#documentation_command = 'K'
   let g:jedi#rename_command = '<leader>R'
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

   " TODO breakpoints
endif

if dein#tap('deoplete-jedi') && has('nvim')
   autocmd MyAutoCmd FileType python setlocal omnifunc=
   let deoplete#sources#jedi#show_docstring = 1
endif

if dein#tap('nvim-ipy')
   let g:nvim_ipy_perform_mappings = 0
   map <silent> <leader>r  <Plug>(IPy-Run)
   map <silent> <leader>c  <Plug>(IPy-Interrupt)
   map <silent> <leader>C  <Plug>(IPy-Terminate)

   " let g:ipy_shortprompt = '1'
endif

if dein#tap('deoplete-clang')
   " sudo find /usr/ -name libclang.so
   let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.5/lib/libclang.so'
   let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.5/'
endif

if dein#tap('neosnippet.vim')
   let g:neosnippet#enable_snipmate_compatibility = 1
   let g:neosnippet#enable_preview = 1
   let g:neosnippet#enable_completed_snippet = 1
   let g:neosnippet#enable_complete_done = 1
   let g:neosnippet#expand_word_boundary = 1
   " let g:neosnippet#disable_runtime_snippets = { '_': 1 }
   let g:neosnippet#data_directory  = '$HOME/.config/nvim/snippets'
   let g:neosnippet#snippets_directory =
            \'$HOME/.config/nvim/snippets'
   " \.dein#get('vim-snippets').path.'/snippets,'
   " \.dein#get('neosnippet-snippets').path.'/neosnippets'
   " \ dein#get('vim-go').path.'/gosnippets/snippets'
   " \ dein#get('mpvim').path.'/snippets',
   " \ dein#get('ansible-vim').path.'/UltiSnips',

   " imap <expr><C-o> neosnippet#expandable_or_jumpable()
   "    \ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
   " xmap <silent><C-s>      <Plug>(neosnippet_register_oneshot_snippet)
   imap <silent><C-Space>  <Plug>(neosnippet_start_unite_snippet)
   imap <silent><C-k>      <Plug>(neosnippet_expand_or_jump)
   smap <silent><C-k>      <Plug>(neosnippet_expand_or_jump)
   xmap <silent><C-k>      <Plug>(neosnippet_expand_target)
endif

" if dein#tap('vim-easytags')
" set tags=./tags,./TAGS,tags;TAGS;   " make vim look for tags file reverse-recursivly ;)
" let g:easytags_dynamic_files = 1    " make easytags use this file instead of global
" let g:easytags_async = 1            " make easytag update async
" let g:easytags_opts = ['--c-kinds=+defgpstuxm --fields=+iaS --extra=+q']
" let g:easytags_auto_update = 0      " that kills the io in the kernel
" nmap <F8> :UpdateTags<CR>
" endif

if dein#tap('vim-gita')
   nnoremap gcc :Gita status<CR>
   augroup mygita
      autocmd!
      autocmd FileType gita-commit nmap gcc <Plug>(gita-status-open)
      autocmd FileType gita-status nmap gcc <Plug>(gita-commit-open)
      autocmd FileType gita-commit,gita-status nmap rm <Plug>(gita-rm)
      autocmd FileType gita-commit,gita-status nmap rc <Plug>(gita-rm-cached)
      autocmd FileType gitcommit,gita-commit setlocal spell
   augroup END
endif

if dein#tap('indentLine')
   let g:indentLine_char = "┆"
   " let g:indentLine_color_term = 239
   " let g:indentLine_setColors = 0
endif

if dein#tap('limelight.vim')
   if has('gui')
      let g:limelight_conceal_guifg = '1'
   else
      let g:limelight_conceal_ctermfg = 'gray'
      let g:limelight_conceal_ctermfg = 240
      " let g:limelight_conceal_ctermfg = '1'
   endif
endif
