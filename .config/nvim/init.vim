" This File is called at the very start

" Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
   set nocompatible               " Be iMproved
endif

" lazy load filetype {{{
function! s:lazy_load_filetype() abort
   if &l:filetype ==# '' && bufname('%') ==# ''
      return
   endif

   redir => filetype_out
   silent! filetype
   redir END
   if filetype_out =~# 'OFF'
      silent! filetype plugin indent on
      syntax enable
      filetype detect
   endif
endfunction

"}}}

augroup MyAutoCmd
   autocmd!
augroup END

" Initialize base requirements {{{
if has('vim_starting')
   source $HOME/.config/nvim/start.vim
   if has('nvim')
      source $HOME/.config/nvim/start_nvim.vim
   endif
endif

" }}}
" Initialize dein.vim (package manager) {{{
let s:path = expand('$HOME/.config/nvim/dein.vim')
if dein#load_state(s:path)
   call dein#begin(s:path, [$MYVIMRC, '$HOME/.config/nvim/plugins.vim'])
   source $HOME/.config/nvim/plugins.vim
   call dein#end()
   call dein#save_state()
   if dein#check_install()
      if ! has('nvim')
         set nomore
      endif
      call dein#install()
   endif
endif

" plugin specific settings
"source $HOME/.config/nvim/plugins_all.vim

if ! has('vim_starting')
	call dein#call_hook('source')
	call dein#call_hook('post_source')

   filetype plugin indent on
   syntax enable
endif

" }}}
" Loading configuration modules {{{
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/utils.vim
call s:lazy_load_filetype()
source $HOME/.config/nvim/theme.vim
" source $HOME/.config/nvim/bindings.vim

" }}}
" Reload vim config automatically {{{
execute 'autocmd MyAutoCmd BufWritePost $HOME/.config/nvim/*vim nested source $MYVIMRC | redraw'

" }}}

set secure

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
