" ------
" Goyo
" -------

let g:goyo_width = 103

" s:goyo_enter() "{{{
" Disable visual candy in Goyo mode
function! s:goyo_enter()
   if has('gui_running')
      " Gui fullscreen
      set fullscreen
   elseif exists('$TMUX')
      " Hide tmux status
      silent !tmux set status off
      " TODO tmux - zoom
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
   endif

   set noshowcmd
   set scrolloff=999

   SignifyDisable
   SignatureToggleSigns
   QuickScopeToggle 

   " Activate Limelight
   Limelight

   " TODO set styling for folds in pandoc
endfunction

" }}}
" s:goyo_leave() "{{{
" Enable visuals when leaving Goyo mode
function! s:goyo_leave()
   if has('gui_running')
      " Gui exit fullscreen
      set nofullscreen
   elseif exists('$TMUX')
      " Show tmux status
      silent !tmux set status on
      " TODO tmux unzoom
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
   endif

   set showcmd
   set scrolloff=5

   SignifyEnable
   SignatureToggleSigns
   QuickScopeToggle 

   " De-activate Limelight
   Limelight!

   " source $HOME/.config/nvim/theme.vim
endfunction
" }}}

" Goyo Commands {{{
autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()
" }}}
