" -----------
" Plugin specific config
" -----------

scriptencoding utf-8

if dein#tap('denite.nvim')
  cnoreabbrev D Denite

  " denite option
  let s:denite_options = {
        \ 'default' : {
        \ 'winheight' : 15,
        \ 'mode' : 'insert',
        \ 'quit' : 1,
        \ 'highlight_matched_char' : 'MoreMsg',
        \ 'highlight_matched_range' : 'MoreMsg',
        \ 'direction': 'rightbelow',
        \ 'statusline' : has('patch-7.4.1154') ? v:false : 0,
        \ 'prompt' : '➭',
        \ }}

  " function! s:profile(opts) abort
  "   for fname in keys(a:opts)
  "     for dopt in keys(a:opts[fname])
  "       call denite#custom#option(fname, dopt, a:opts[fname][dopt])
  "     endfor
  "   endfor
  " endfunction
  " 
  " call s:profile(s:denite_options)
  " 
  " " buffer source
  " call denite#custom#var(
  "       \ 'buffer',
  "       \ 'date_format', '%m-%d-%Y %H:%M:%S')
  " 
  " " denite command
  " if !has("win32")
  "   if executable('rg')
  "     " For ripgrep
  "     " Note: It is slower than ag
  "     call denite#custom#var('file_rec', 'command',
  "           \ ['rg', '--hidden', '--files', '--glob', '!.git', '--glob', '']
  "           \ + zvim#util#Generate_ignore(g:spacevim_wildignore, 'rg')
  "           \ )
  "   elseif executable('ag')
  "     " Change file_rec command.
  "     call denite#custom#var('file_rec', 'command',
  "           \ ['ag' , '--nocolor', '--nogroup', '-g', '']
  "           \ + zvim#util#Generate_ignore(g:spacevim_wildignore, 'ag')
  "           \ )
  "   endif
  " else
  "   if executable('pt')
  "     " For Pt(the platinum searcher)
  "     " NOTE: It also supports windows.
  "     call denite#custom#var('file_rec', 'command',
  "           \ ['pt', '--follow', '--nocolor', '--nogroup', '-g:', ''])
  "   endif
  " endif
  " 
  " call denite#custom#alias('source', 'file_rec/git', 'file_rec')
  " call denite#custom#var('file_rec/git', 'command',
  "       \ ['git', 'ls-files', '-co', '--exclude-standard'])
  " 
  " " FIND and GREP COMMANDS
  " if executable('rg')
  "   " Ripgrep command on grep source
  "   call denite#custom#var('grep', 'command', ['rg'])
  "   call denite#custom#var('grep', 'default_opts',
  "         \ ['--vimgrep', '--no-heading'])
  "   call denite#custom#var('grep', 'recursive_opts', [])
  "   call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  "   call denite#custom#var('grep', 'separator', ['--'])
  "   call denite#custom#var('grep', 'final_opts', [])
  " 
  " elseif  executable('pt')
  "   " Pt command on grep source
  "   call denite#custom#var('grep', 'command', ['pt'])
  "   call denite#custom#var('grep', 'default_opts',
  "         \ ['--nogroup', '--nocolor', '--smart-case'])
  "   call denite#custom#var('grep', 'recursive_opts', [])
  "   call denite#custom#var('grep', 'pattern_opt', [])
  "   call denite#custom#var('grep', 'separator', ['--'])
  "   call denite#custom#var('grep', 'final_opts', [])
  " elseif executable('ag')
  "   call denite#custom#var('grep', 'command', ['ag'])
  "   call denite#custom#var('grep', 'recursive_opts', [])
  "   call denite#custom#var('grep', 'pattern_opt', [])
  "   call denite#custom#var('grep', 'separator', ['--'])
  "   call denite#custom#var('grep', 'final_opts', [])
  "   call denite#custom#var('grep', 'default_opts',
  "         \ [ '--vimgrep', '--smart-case' ])
  " elseif executable('ack')
  "   " Ack command
  "   call denite#custom#var('grep', 'command', ['ack'])
  "   call denite#custom#var('grep', 'recursive_opts', [])
  "   call denite#custom#var('grep', 'pattern_opt', ['--match'])
  "   call denite#custom#var('grep', 'separator', ['--'])
  "   call denite#custom#var('grep', 'final_opts', [])
  "   call denite#custom#var('grep', 'default_opts',
  "         \ ['--ackrc', $HOME.'/.config/ackrc', '-H',
  "         \ '--nopager', '--nocolor', '--nogroup', '--column'])
  " endif
  " 
  " " enable unite menu compatibility
  " call denite#custom#var('menu', 'unite_source_menu_compatibility', 1)
  " 
  " " KEY MAPPINGS
  " let s:insert_mode_mappings = [
  "       \ ['jk', '<denite:enter_mode:normal>', 'noremap'],
  "       \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
  "       \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
  "       \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
  "       \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
  "       \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
  "       \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
  "       \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
  "       \ ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
  "       \ ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
  "       \ ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
  "       \ ['<Up>', '<denite:assign_previous_text>', 'noremap'],
  "       \ ['<Down>', '<denite:assign_next_text>', 'noremap'],
  "       \ ['<C-Y>', '<denite:redraw>', 'noremap'],
  "       \ ]
  " 
  " let s:normal_mode_mappings = [
  "       \ ["'", '<denite:toggle_select_down>', 'noremap'],
  "       \ ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
  "       \ ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
  "       \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
  "       \ ['<C-j>', '<denite:move_to_next_line>', 'noremap'],
  "       \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
  "       \ ['<C-k>', '<denite:move_to_previous_line>', 'noremap'],
  "       \ ['gg', '<denite:move_to_first_line>', 'noremap'],
  "       \ ['<C-t>', '<denite:do_action:tabopen>', 'noremap'],
  "       \ ['<C-v>', '<denite:do_action:vsplit>', 'noremap'],
  "       \ ['<C-s>', '<denite:do_action:split>', 'noremap'],
  "       \ ['q', '<denite:quit>', 'noremap'],
  "       \ ['r', '<denite:redraw>', 'noremap'],
  "       \ ]
  " 
  " for s:m in s:insert_mode_mappings
  "   call denite#custom#map('insert', s:m[0], s:m[1], s:m[2])
  " endfor
  " for s:m in s:normal_mode_mappings
  "   call denite#custom#map('normal', s:m[0], s:m[1], s:m[2])
  " endfor
  " 
  " unlet s:m s:insert_mode_mappings s:normal_mode_mappings
  " 
  " 
  " exe 'nnoremap <silent><nowait> [denite] :<c-u>LeaderGuide "' .
  "       \ <leader>d . '"<CR>'
  " exe 'nmap ' . . ' [denite]'
  " let g:_spacevim_mappings_denite = {}
  " nnoremap <silent> [denite]r
  "       \ :<C-u>Denite -resume<CR>
  " let g:_spacevim_mappings_denite.r = ['Denite -resume',
  "       \ 'resume denite window']
  " nnoremap <silent> [denite]f  :<C-u>Denite file_rec<cr>
  " let g:_spacevim_mappings_denite.f = ['Denite file_rec', 'file_rec']
  " nnoremap <silent> [denite]i  :<C-u>Denite file_rec/git<cr>
  " let g:_spacevim_mappings_denite.i = ['Denite file_rec/git', 'git files']
  " nnoremap <silent> [denite]g  :<C-u>Denite grep<cr>
  " let g:_spacevim_mappings_denite.g = ['Denite grep', 'denite grep']
  " nnoremap <silent> [denite]t  :<C-u>Denite tag<CR>
  " let g:_spacevim_mappings_denite.t = ['Denite tag', 'denite tag']
  " nnoremap <silent> [denite]T  :<C-u>Denite tag:include<CR>
  " let g:_spacevim_mappings_denite.T = ['Denite tag/include',
  "       \ 'denite tag/include']
  " nnoremap <silent> [denite]j  :<C-u>Denite jump<CR>
  " let g:_spacevim_mappings_denite.j = ['Denite jump', 'denite jump']
  " nnoremap <silent> [denite]h  :<C-u>Denite neoyank<CR>
  " let g:_spacevim_mappings_denite.h = ['Denite neoyank', 'denite neoyank']
  " nnoremap <silent> [denite]<C-h>  :<C-u>DeniteCursorWord help<CR>
  " let g:_spacevim_mappings_denite['<C-h>'] = ['DeniteCursorWord help',
  "       \ 'denite with cursor word help']
  " nnoremap <silent> [denite]o  :<C-u>Denite -buffer-name=outline
  "       \  -auto-preview outline<CR>
  " let g:_spacevim_mappings_denite.o = ['Denite outline', 'denite outline']
  " nnoremap <silent> [denite]e  :<C-u>Denite
  "       \ -buffer-name=register register<CR>
  " let g:_spacevim_mappings_denite.e = ['Denite register', 'denite register']
  " nnoremap <silent> [denite]<Space> :Denite menu:CustomKeyMaps<CR>
  " let g:_spacevim_mappings_denite['<Space>'] = ['Denite menu:CustomKeyMaps',
  "       \ 'denite customkeymaps']

  nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>

  nnoremap <silent> <leader>sb :<C-u>Denite buffer -mode=normal<CR>
  " nnoremap <silent> <leader>dm :Unite mapping<cr>

  nnoremap <silent> <space>fm  :<C-u>Denite file_mru<CR>
  nnoremap <silent> <space>dr  :<C-u>Denite -resume<CR>
  nnoremap <silent> <space>sr  :<C-u>Denite register<CR>

  nnoremap <silent> <leader>/g :<C-u>Denite grep<CR>
  nnoremap <silent> <leader>/w :<C-u>DeniteCursorWord grep<CR>

  " nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
  " nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
  " nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
  " nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
  " nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

endif

if dein#tap('denite-exta')
  " nnoremap <silent> <leader>q  :<C-u>Denite quickfix -mode=normal -auto-resize<CR>
  " nnoremap <silent> <leader>o  :<C-u>Denite location_list -mode=normal -auto-resize<CR>
  nnoremap <silent> <leader>sh :<C-u>Denite history:search -mode=normal<CR>
  nnoremap <silent> <leader>sc :<C-u>Denite history:cmd -mode=normal<CR>
endif

if dein#tap('unite-location')
  " nnoremap <silent> <space>j  :call execute('Denite -resume -select=+'.v:count1.' -immediately')<CR>
  " nnoremap <silent> <space>k  :call execute('Denite -resume -select=-'.v:count1.' -immediately')<CR>
  nnoremap <silent> <space>q  :<C-u>Denite quickfix -mode=normal -auto-resize<CR>
  nnoremap <silent> <space>o  :<C-u>Denite location_list -mode=normal -auto-resize<CR>
endif

if dein#tap('neoyank.vim')
  nnoremap <leader>sy :Denite neoyank -default-action=append<cr>
  " -mode=normal
endif

if dein#tap('vim-localvimrc')
  let g:localvimrc_ask = 0
  let g:localvimrc_sandbox = 0

  nnoremap <leader>fcL :<C-u>LocalVimRC<CR>
  nnoremap <leader>fcl :<C-u>LocalVimRCEdit<CR>
endif

if dein#tap('vim-rooter')
  let g:rooter_silent_chdir = 1
  let g:rooter_manual_only = 1
  let g:rooter_patterns = ['.git/']
endif

if dein#tap('vim-tmux-navigator')
  let g:tmux_navigator_no_mappings = 1
  "unmap <A-h>
  "unmap <A-j>
  "unmap <A-k>
  "unmap <A-l>
  nnoremap <silent> <A-h> :<C-u>TmuxNavigateLeft<cr>
  nnoremap <silent> <A-j> :<C-u>TmuxNavigateDown<cr>
  nnoremap <silent> <A-k> :<C-u>TmuxNavigateUp<cr>
  nnoremap <silent> <A-l> :<C-u>TmuxNavigateRight<cr>
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
        \ '\c\vgundo|undotree|diffpanel|vimfiler|tagbar|nerd_tre:|[unite]'
  " let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_splits = 0

  nnoremap <leader>tw :AirlineToggleWhitespace<cr>
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
  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
  elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
  " search for current word in project: acording to current dir!!
  nnoremap <leader>* :<C-u>Ack! <c-r><c-w><cr>
endif

if dein#tap('undotree')
  nnoremap <Leader>gu  :<C-u>UndotreeToggle<CR>
  nnoremap <F5> :<C-u>UndotreeToggle<cr>
endif

if dein#tap('fzf.vim')
  nnoremap <c-p> :<C-u>FZF<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  " imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  nnoremap <leader>p :<C-u>History<cr>

  if executable('rg')
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)
  endif
endif

if dein#tap('tagbar')
  nnoremap <Leader>gu  :<C-u>TagbarToggle<CR>
  nnoremap <F6> :<C-u>TagbarToggle<CR>
endif

if dein#tap('nerdtree')
  " autocmd vimenter * NERDTree

  noremap <C-n> :<c-u>NERDTreeToggle<CR>



  " How can I open NERDTree automatically when vim starts up on opening a directory?
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " How can I close vim if the only window left open is a NERDTree?
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


  " " NERDTress File highlighting
  " function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  "    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  "    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  " endfunction
  "
  " call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  " call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  " call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  " call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  " call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  " call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  " call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
endif

if dein#tap('nerdcommenter')
  let NERDSpaceDelims=1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCommentEmptyLines = 1
  " let g:NERDTrimTrailingWhitespace = 1
  let g:NERDCompactSexyComs = 1

  " nmap <plug>NERDCommenterComment <plug>NERDCommenterCommentj
  " nmap <leader>cc <plug>NERDCommenterComment
  " silent! call repeat#set("\<Plug>NERDCommenterComment", v:count)
  " vnoremap <leader>cc <plug>NERDCommenterToggle
endif

if dein#tap('vim-easy-align')
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(LiveEasyAlign)
  " " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(LiveEasyAlign)
endif

if dein#tap('vim-table-mode')
  " let g:table_mode_corner_corner="+"
  " let g:table_mode_header_fillchar="="

  let g:table_mode_corner="|"

  let g:table_mode_align_char=":"
endif

if dein#tap('neoformat')
  let g:neoformat_c_glibgnuindent = {
        \ 'exe': 'indent',
        \ 'args': ['--braces-on-if-line',
        \ '--case-brace-indentation 0',
        \ '--case-indentation 2',
        \ '--braces-after-struct-decl-line',
        \ '--line-length 80',
        \ '--no-tabs',
        \ '--cuddle-else',
        \ '--dont-line-up-parentheses',
        \ '--continuation-indentation 4',
        \ '--honour-newlines',
        \ '--tab-size 8',
        \ '--indent-level 2',
        \ '--leave-preprocessor-space'],
        \ 'stdin': 1,
        \ }

  let g:neoformat_c_clangformat = {
        \ 'exe': 'clang-format',
        \ 'args': ['-style=file'],
        \ }

  nnoremap <leader>fa :<c-u>undojoin \| silent Neoformat<cr>
  vnoremap <leader>ff :<c-u>undojoin \| silent '<,'>Neoformat<cr>

  au MyAutoCmd filetype c,cpp nnoremap <leader>fC :<c-u>silent exec "!ln -sf " . $HOME . "/.config/.clang-format ."<cr>

  let g:neoformat_try_formatprg = 1

  let g:neoformat_only_msg_on_error = 1
  " Enable alignment
  let g:neoformat_basic_format_align = 1

  " Enable tab to spaces conversion
  let g:neoformat_basic_format_retab = 1

  " Enable trimmming of trailing whitespace
  let g:neoformat_basic_format_trim = 1
endif


if dein#tap('vim-signify')
  autocmd MyAutoCmd User Fugitive SignifyRefresh
  let g:signify_sign_change = '~'
  " let g:signify_update_on_focusgained  = 1

  " ignore whitespaces
  let g:signify_vcs_list = ['cvs', 'hg', 'svn']
  " 'bzr'
  "['accurev', 'bzr', 'cvs', 'darcs', 'fossil', 'hg', 'perforce', 'rcs', 'svn', 'tfs']

  " disable for git
  if !exists('g:signify_vcs_cmds')
    let g:signify_vcs_cmds = { 'git': 'git diff --no-color --no-ext-diff -U0 -w -- %f' }
    " let g:signify_vcs_cmds = { 'svn': 'svn diff --diff-cmd %d -x -U0 -- %f' }
  endif

  nmap <leader>gj <plug>(signify-next-hunk)
  nmap <leader>gk <plug>(signify-prev-hunk)
endif

if dein#tap('vim-gitgutter')
  " let g:gitgutter_diff_args = '-w'
  let g:gitgutter_max_signs = 3000

  nmap <leader>gj <Plug>GitGutterNextHunk
  nmap <leader>gk <Plug>GitGutterPrevHunk
  nmap <Leader>gs <Plug>GitGutterStageHunk
  nmap <Leader>gu <Plug>GitGutterUndoHunk<Plug>GitGutter
  nmap <Leader>gp <Plug>GitGutterPreviewHunk
endif

if dein#tap('vimagit')
  nnoremap <leader>gS :<C-u>Magit<CR>
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

if dein#tap('vim-bookmarks')
  " let g:bookmark_save_per_working_dir = 1
  let g:bookmark_auto_save = 1
  " let g:bookmark_auto_save_file = expand('$HOME/.config/nvim/tmp/bookmarks')

  " action                                          shortcut      command
  " add/remove bookmark at current line              mm            :bookmarktoggle
  " add/edit/remove annotation at current line       mi            :bookmarkannotate <text>
  " jump to next bookmark in buffer                  mn            :bookmarknext
  " jump to previous bookmark in buffer              mp            :bookmarkprev
  " show all bookmarks (toggle)                      ma            :bookmarkshowall
  " clear bookmarks in current buffer only           mc            :bookmarkclear
  " clear bookmarks in all buffers                   mx            :bookmarkclearall
  " move up bookmark at current line                 [count]mkk    :bookmarkmoveup [<count>]
  " move down bookmark at current line               [count]mjj    :bookmarkmovedown [<count>]
  " move bookmark at current line to another line    [count]mg     :bookmarkmovetoline <line>
  " save all bookmarks to a file                     :bookmarksave <file_path>
  " load bookmarks from a file                       :bookmarkload <file_path>

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
  nmap <leader>tq <Plug>(QuickScopeToggle)
  vmap <leader>tq <Plug>(QuickScopeToggle)
  " let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  au MyAutoCmd filetype qf let b:qs_local_disable=1
endif

if dein#tap('accelerated-jk')
  " nmap j <Plug>(accelerated_jk_gj_position)
  " nmap k <Plug>(accelerated_jk_gk_position)
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
endif

if dein#tap('comfortable-motion.vim')
  " let g:comfortable_motion_no_default_key_mappings = 1
  " let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

  " If you would like to use scrolling proportional to the window height, you may use settings such as these:
  " nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
  " nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
  " nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
  " nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

  noremap <silent> <ScrollWheelDown> :<C-u>call comfortable_motion#flick(40)<CR>
  noremap <silent> <ScrollWheelUp>   :<C-u>call comfortable_motion#flick(-40)<CR>
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

endif

if dein#tap('vim-asterisk')
  map z*  <Plug>(asterisk-z*)
  map gz* <Plug>(asterisk-gz*)
  map z#  <Plug>(asterisk-z#)
  map gz# <Plug>(asterisk-gz#)
  " let g:asterisk#keeppos = 1
endif

if dein#tap('vim-pandoc-syntax')
  let g:pandoc#syntax#codeblocks#embeds#langs = []
endif

if dein#tap('vim-pandoc')
  " let g:pandoc#command#autoexec_command = 'Pandoc pdf -s'
  let g:pandoc#formatting#textwidth = 100
  let g:pandoc#command#use_message_buffers = '0'
  " let g:pandoc#biblio#use_bibtool = 1

  let g:pandoc#modules#disabled = ['chdir']

  autocmd MyAutoCmd FileType pandoc nnoremap <localleader>zc :r !zotcite<CR>


  " toggle autoexec
  autocmd MyAutoCmd FileType pandoc,markdown nnoremap <localleader>aa
        \ :let g:pandoc#command#autoexec_on_writes = g:pandoc#command#autoexec_on_writes == 1 ? 0 : 1<CR>
        \ :echomsg "Pandoc autoexec " . string(g:pandoc#command#autoexec_on_writes == 0 ? "deactivated" : "activated")<CR>

  " use fast fold
  if dein#tap('FastFold')
    augroup EnableFastFolds
      au!
      autocmd InsertEnter <buffer> setlocal foldmethod=manual
      autocmd InsertLeave <buffer> setlocal foldmethod=expr
    augroup end
  endif
endif

if dein#tap('vim-pandoc-after')
  let g:pandoc#after#modules#enabled = ["unite", "neosnippets"]
endif

if dein#tap('vimtex')
  let g:tex_flavor = "latex"
  " let g:tex_conceal = "adgm"
  let g:tex_conceal = "adgms"
  let g:vimtex_format_enabled = 1         " formating with gq considers comments

  " let g:vimtex_complete_close_braces = 1
  " TODO disable deliminate on latex files

  let g:vimtex_compiler_enabled = 1
  let g:vimtex_quickfix_mode = 0          " do not open automatically

  let g:vimtex_compiler_method = 'latexmk'
  let g:vimtex_compiler_latexmk_continuous = 1
  let g:vimtex_compiler_latexmk_background = 1
  let g:vimtex_compiler_latexmk_callback = 1

  " reload formating and folds
  nmap <silent> zuz <plug>(vimtex-reload)<Plug>(FastFoldUpdate)
  nmap <silent> <localleader>lL <plug>(vimtex-compile-ss)
  " nmap <silent> <localleader>lo <plug>(vimtex-compile-ss)
  autocmd MyAutoCmd FileType tex nmap <silent> <leader>m <plug>(vimtex-compile-ss)

  if has('nvim') && executable('nvr')
    let g:vimtex_compiler_progname = 'nvr'
  endif
  " let g:vimtex_view_method = 'zathura'
  if executable('zathura')
    let g:vimtex_view_general_viewer = 'zathura'
  endif

  let g:vimtex_fold_enabled = 1
  " faster folding > alternative usw FastFold
  " let g:vimtex_fold_manual = 1

  let g:vimtex_fold_types = {
        \ 'comments' : {'enabled' : 1},
        \ 'sections' : {
        \   'sections' : [
        \     'part',
        \     'chapter',
        \     'section',
        \     'subsection',
        \     'subsubsection',
        \     'paragraph',
        \     'subparagraph',
        \   ],
        \ },
        \}

  let g:vimtex_fold_types_sections = [
        \ "part",
        \ "chapter",
        \ "section",
        \ "subsection",
        \ "subsubsection",
        \ ]
endif

if dein#tap('vim-online-thesaurus')
  let g:online_thesaurus_map_keys = 0
  nnoremap <localleader>O :<C-u>OnlineThesaurusCurrentWord<CR>
endif

if dein#tap('FastFold')
  let g:tex_fold_enabled=1
  let g:fastfold_savehook = 1 " don't update on save
  nmap zuz <Plug>(FastFoldUpdate)
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
  let g:jedi#goto_command = '<localleader>d'
  let g:jedi#goto_assignments_command = '<localleader>a'
  let g:jedi#documentation_command = 'K'
  let g:jedi#rename_command = '<localleader>r'
  let g:jedi#usages_command = '<leader>rf'

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
  map <silent> <localleader>pr  <Plug>(IPy-Run)
  map <silent> <localleader>pc  <Plug>(IPy-Interrupt)
  map <silent> <localleader>pC  <Plug>(IPy-Terminate)

  " let g:ipy_shortprompt = '1'
endif

if dein#tap('deoplete-clang')
  " sudo find /usr/ -name libclang.so
  if !empty(glob("/usr/lib/libclang.so"))                                " on Arch
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'
  elseif !empty(glob("/usr/lib/llvm-5.0/lib/libclang.so"))               " on Debian
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-5.0/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-5.0/'
  elseif !empty(glob("/usr/lib/llvm-3.5/lib/libclang.so"))               " on Debian
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.5/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.5/'
  else
    autocmd VimEnter * echomsg string('deoplete-clang: libclang not found!!!')
  endif

  let g:deoplete#sources#clang#sort_algo = 'priority'
endif

if dein#tap('tweekmonster/deoplete-clang2')
  " fill in the g:neomake_<filetype>_clang_maker variable with the clang executable path and flags.
  " You will still need to enable it with g:neomake_<filetype>_enabled_makers = ["clang"]
  let g:deoplete#sources#clang#autofill_neomake = 1

  " maximum number of lines to search for a #ifdef or #endif
  let g:deoplete#sources#clang#preproc_max_lines = 300

  " :!which -a clang
  if !empty(glob("/usr/bin/clang"))
    let g:deoplete#sources#clang#executable = "/usr/bin/clang"
  else
    echomsg string('deoplete-clang2: clang not found!!!')
  endif
endif

if dein#tap('lyuts/vim-rtags')
  let g:rtagsJumpStackMaxSize = 1000
  let g:rtagsMaxSearchResultWindowHeight = 15
  let g:rtagsMinCharsForCommandCompletion = 100
  let g:rtagsUseLocationList = 1


  " <space>rf :Unite rtags/references

  " let g:rtagsUseDefaultMappings = 0
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><C-]>            :<C-u>call rtags#JumpTo(g:SAME_WINDOW)<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cb  :<C-u>call rtags#JumpBack()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cc  :<C-u>call rtags#FindRefs()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cC  :<C-u>call rtags#FindSuperClasses()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cf  :<C-u>call rtags#FindSubClasses()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cn  :<C-u>call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cp  :<C-u>call rtags#JumpToParent()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cs  :<C-u>call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><Leader>u        :<C-u>call rtags#SymbolInfo()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cu  :<C-u>call rtags#SymbolInfo()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>cv  :<C-u>call rtags#FindVirtuals()<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><Space>]         :<C-u>YcmCompleter GoTo<CR>
  " au MyAutoCmd c,cpp,objc,objcpp nnoremap <silent><buffer><LocalLeader>] :<C-u>tag <C-r>=expand("<cword>")<CR><CR>
endif

if dein#tap('neosnippet.vim')
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#enable_preview = 1
  let g:neosnippet#enable_completed_snippet = 1
  let g:neosnippet#enable_complete_done = 1
  let g:neosnippet#expand_word_boundary = 1
  " let g:neosnippet#disable_runtime_snippets = { '_': 1 }
  let g:neosnippet#data_directory  = expand('$HOME/.config/nvim/snippets')
  let g:neosnippet#snippets_directory = expand('$HOME/.config/nvim/snippets')
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

if dein#tap('neomake')
  autocmd MyAutoCmd BufWritePost * Neomake
  " autocmd MyAutoCmd BufWritePost * call <SID>neomake_custom()
  " function! s:neomake_custom()
  "    let filetypes = [
  "             \   'ansible', 'python', 'php', 'ruby', 'vim', 'go', 'sh',
  "             \   'javascript', 'javascript.jsx', 'json', 'css', 'yaml',
  "             \   'markdown', 'html'
  "             \ ]
  "
  "    if empty(&buftype) && index(filetypes, &filetype) > -1
  "       Neomake
  "    endif
  " endfunction

  let g:neomake_verbose = 0
  " let g:neomake_serialize = 1
  " let g:neomake_serialize_abort_on_error = 1
  let g:neomake_logfile = '/tmp/neomake.log'

  cnoreabbrev N! Neomake!
  cnoreabbrev N Neomake


  let g:neomake_python_pycodestyle_args = ['--max-line-length=9999']
  let g:neomake_python_pylint_args = ['--output-format=text', '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"', '--reports=no',
        \ '--rcfile', expand('$HOME/.config/pylintrc')]
  " \ '--disable=C0301', '']

endif

if dein#tap('vim-dispatch')
  " nnoremap <leader>m :<c-u>Dispatch<CR>

  autocmd MyAutoCmd FileType python let b:dispatch = 'python %'
  autocmd MyAutoCmd FileType zsh,bash,sh let b:dispatch = './%'
endif

if dein#tap('OMNeTpp4.x-NED-Syntax-file')
  autocmd MyAutoCmd BufNewFile,BufRead *.ned set filetype=ned
  autocmd MyAutoCmd BufNewFile,BufRead *.ned set commentstring="//%s"
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
  nnoremap gcc :<c-u>Gita status<CR>
  augroup mygita
    autocmd!
    autocmd FileType gita-commit nmap gcc <Plug>(gita-status-open)
    autocmd FileType gita-status nmap gcc <Plug>(gita-commit-open)
    autocmd FileType gita-commit,gita-status nmap rm <Plug>(gita-rm)
    autocmd FileType gita-commit,gita-status nmap rc <Plug>(gita-rm-cached)
    autocmd FileType gitcommit,gita-commit setlocal spell
  augroup END
endif

if dein#tap('gina.vim')
  call gina#custom#command#option(
        \ '/\%(status\|changes\)',
        \ '--opener', 'split',
        \ '--ignore-submodules'
        \)
endif

if dein#tap('agit.vim')
  let g:agit_enable_auto_refresh = 1
  nnoremap <leader>gl :<c-u>Agit<CR>
  nnoremap <leader>gL :<c-u>AgitFile<CR>
endif

" if dein#tap('indentLine')
"   let g:indentLine_char = "┆"
"   " let g:indentLine_color_term = 239
"   " let g:indentLine_setColors = 0
" endif

if dein#tap('vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1

  nmap <silent> <Leader>ti <Plug>IndentGuidesToggle

  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=Black ctermbg=Black ctermfg=None
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=None ctermbg=None

  " for vim-indent-guides
  " hi IndentGuidesOdd  ctermbg=Black
  " hi IndentGuidesEven ctermbg=None
endif 

if dein#tap('goyo.vim')
  nnoremap <leader>tg :<c-u>Goyo<CR>
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

if dein#tap('vim-leader-guide')
endif

if dein#tap('LanguageClient-neovim')
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ }

        " \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],

  " let $RUST_BACKTRACE = 1
  " let g:LanguageClient_loggingLevel = 'INFO'
  " let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
  " let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

  nnoremap <F5> :<c-u>call LanguageClient_contextMenu()<CR>
  " Or map each action separately
  nnoremap <silent> K :<c-u>call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <localleader>d :<c-u>call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <localleader>r :<c-u>call LanguageClient#textDocument_rename()<CR>

  let g:LanguageClient_autoStart = 1
endif
