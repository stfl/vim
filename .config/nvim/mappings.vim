" --------------
"  Key mappings
" -------------

" Release keymappings for plug-in.
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>
nnoremap , <Nop>
xnoremap , <Nop>

" Fix keybind name for Ctrl+Spacebar
map <Nul> <C-Space>
map! <Nul> <C-Space>

let g:mapleader="\<Space>"
" let mapleader = ","  " rebmap the <Leader> key
let g:maplocalleader=','

" noremap ; :
" noremap : ;

inoremap jk <Esc>
" inoremap <Esc> <nop>

" Disable EX-mode
nnoremap  Q <Nop>
nnoremap gQ <Nop>

" Move across wrapped lines like regular lines
" Go to the first non-blank character of a line
" noremap 0 ^
" Just in case you need to go to the very beginning of a line
" noremap ^ 0

" Toggle fold
" nnoremap <CR> za
nnoremap <expr> <Tab> foldlevel('.') ? 'za' : '<Tab>'
" cnoremap <cr> <cr>zv

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

noremap <silent> j gj
noremap <silent> k gk
noremap <silent> H 0
noremap <silent> L $

" Toggle editor visuals
" nnoremap <leader><F7> :setlocal list!<CR>
nnoremap <Leader>ts :setlocal spell!<cr>
nnoremap <Plug>ToggleNumber :setlocal nonumber! norelativenumber!<CR>
nmap <Leader>tn <Plug>ToggleNumber
nnoremap <Leader>tL :setlocal nolist!<CR>
" nnoremap <F7> :call TogleVisibility()<CR>
" from solarized at theme.vim
nnoremap <leader>tl :call TogleVisibility()<CR>
nnoremap <Leader>th :nohlsearch<CR>
nnoremap <Leader>tw :setlocal wrap! breakindent!<CR>
nnoremap <C-l> :redraw!<cr>:nohl<cr>

nnoremap <expr> <Plug>ToggleConceal &conceallevel == 0 ? ':setlocal conceallevel=2<CR>' : ':setlocal conceallevel=0<CR>'
nmap <Leader>tc <Plug>ToggleConceal
" <leader>tq >> toggle quick-scope

" split naviagetion
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" formatting
nnoremap <Plug>FormatTextLine gww
nmap <leader>ft <Plug>FormatTextLine

vnoremap <Plug>FormatText gw
vmap <leader>ft <Plug>FormatText

nnoremap <Plug>FormatTextParagraph gwap
nmap <leader>fp <Plug>FormatTextParagraph

nnoremap <silent> <Plug>WhitespaceErase :WhitespaceErase<CR>:AirlineToggleWhitespace<cr>:AirlineToggleWhitespace<cr>
nmap <leader>fw <Plug>WhitespaceErase

" nnoremap <leader>fl :Neoformat  >> plugins_all.vim
" nnoremap <leader>fa :Neoformat > entire file
" vnoremap <leader>ff :Neoformat

" Capitalize first letter in words of selection
vnoremap gU :<C-U>%s/\%V\v<(.)(\w*)/\u\1\L\2/g<CR>:nohl<CR>

nnoremap ZAQ :qa!<CR>
nnoremap ZAZ :wqa<CR>
" nnoremap ZT  :tabclose!<CR>
" nnoremap ZTZ :windo w!<CR>:tabclose<CR>

" select tab to the left if closing, but not if closing the first
" nnoremap <expr> ZW tabpagenr('$') > 1 ? ':windo w!<CR>:tabclose<CR>gT' : ':wqa<CR>'
" nnoremap <expr> ZT tabpagenr('$') > 1
"          \ ? ':tabclose!<CR>' : ':qa!<CR>'
" nmap     <expr> ZZ winnr('$') == 1 && tabpagenr() != 1 && tabpagenr('$') != tabpagenr()
"          \ ? 'ZZgT' : 'ZZ'

" Easily switch to directory of current file
" When pressing <leader>cd switch to the directory of the open buffer
nnoremap <Plug>CdCurrentDir :cd %:p:h<CR>:pwd<CR>
nmap <leader>cd <Plug>CdCurrentDir

" Fast saving
nnoremap <Leader>w :<c-u>w<CR>
nnoremap <C-s> :<C-u>w<CR>
vnoremap <C-s> :<C-u>w<CR>
cnoremap <C-s> <C-u>w<CR>
inoremap <C-s> <Esc>:<C-u>w<CR>

" Save a file with sudo
" http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
cmap W!! w !sudo tee % >/dev/null

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
" nnoremap > >>_
" nnoremap < <<_

nnoremap <Plug>TabLeft gt
nmap <leader>l <Plug>TabLeft
nnoremap <Plug>TabRight gT
nmap <leader>h <Plug>TabRight

" past last yanked, not including stuff from d/D/x/X/...
nnoremap gp "0p
nnoremap gP "0P
" nnoremap <Plug>LastYankToReg " TODO
" nmap <leader>rr$reg <Plug>LastYankToReg

" Drag current line/s vertically and auto-indent
" TODO this is shadowed by EasyMotion...
noremap  <Leader>k :m-2<CR>==
vnoremap <Leader>k :m-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv
noremap  <Leader>j :m+<CR>==

" Select last paste
" nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

" Append modeline to EOF
nnoremap <silent> <Leader>am :<c-u>AppendModeline<CR>

" Start an external command with a single bang
nnoremap ! :!

" Allow misspellings
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev t tabe
cnoreabbrev T tabe

cnoreabbrev ln lnext

" Start new line from any cursor position
inoremap <S-Return> <C-o>o

" Quick substitute within selected area
xnoremap s :s//g<Left><Left>

" nnoremap <C-w>z :ZoomToggle<CR>  > in utils.vim

" C-r: Easier search and replace > in utils.vim
" xnoremap <C-r> :<C-u>call VSetSearch('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
         \ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
         \ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
         \ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

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
" nnoremap <C-M> :nohl<CR>
" maps <CR> to :nohl in vim - TODO

" map the F9 key to run make
map <F9> :make<CR>

" Math evaluation
" Evaluate an expression contained in a visual selection and place the answer in a new line below the current line:
" if the $x= is overwritten at the end with the actal formula, it also works to set $a= variables
vnoremap <Plug>MathCalcAppend yo<Esc>p^y$V:!perl -e '$x = <C-R>"; print $x'<CR>-y0j0P
vmap <leader>ma <Plug>MathCalcAppend

" Evaluate an expression contained in a visual selection and replace the visual selection with the answer: - only single line
vnoremap <Plug>MathCalcReplace "aygvrXgv"by:r !perl -e '$x = <C-R>a; print $x'<CR>0"cyWddk:s/<C-R>b/<C-R>c/<CR>
vmap <leader>mr <Plug>MathCalcReplace

" reload and edit rc files
nnoremap <Plug>vimrc-source :so $MYVIMRC<CR>:e<CR>
nmap <leader>fcV <Plug>vimrc-source
nnoremap <leader>fcv :tabe $HOME/.config/nvim/<cr>
nnoremap <leader>fcP :tabe $HOME/.config/nvim/plugins/plugins.vim<cr>
nnoremap <leader>fcp :tabe $HOME/.config/nvim/plugins/other.vim<cr>
nnoremap <leader>fcm :tabe $HOME/.config/nvim/mappings.vim<cr>
nnoremap <plug>zshrc-edit :<c-u>tabe $HOME/.zshrc<CR>
nmap <leader>fcz <plug>zshrc-edit
nnoremap <plug>tmux.conf-edit :<c-u>tabe $HOME/.tmux.conf<CR>
nmap <leader>fct <plug>tmux.conf-edit

" function! ShowLeaderMapping()
"   let c = nr2char(getchar())
"   while c == "\<CursorHold>"
"     let c = nr2char(getchar())
"   endwhile
"   exec 'nmap <leader>'.c
" endfunction
"
" function! ShowLocalLeaderMapping()
"   let c = nr2char(getchar())
"   while c == "\<CursorHold>"
"     let c = nr2char(getchar())
"   endwhile
"   exec 'nmap <localleader>'.c
" endfunction
"
" nnoremap <leader>? :call ShowLeaderMapping()<cr>
" nnoremap <localleader>? :call ShowLocalLeaderMapping()<cr>

" Terminal mappings
if has('nvim')
   nnoremap <Plug>Terminal :vsp term://zsh<cr>
   nmap <leader><C-T> <Plug>Terminal
   tnoremap <Esc> <C-\><C-n>
   tnoremap jk <C-\><C-n>
   tnoremap <A-h> <C-\><C-n><C-w>h
   tnoremap <A-j> <C-\><C-n><C-w>j
   tnoremap <A-k> <C-\><C-n><C-w>k
   tnoremap <A-l> <C-\><C-n><C-w>l
   tnoremap <C-w><C-w> <C-\><C-n><C-w><c-w>
endif

" usefull keys from US-Keyboard - maped to German {{{
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
" " better * # {{{
" " Search for selected text, forwards or backwards. first * then n/N ->
" vnoremap <silent> * :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy/<C-R><C-R>=substitute(
"   \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>
" vnoremap <silent> # :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy?<C-R><C-R>=substitute(
"   \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>
"
" " }}}
