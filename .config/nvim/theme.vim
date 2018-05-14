" ------------
"  Theme
" ------------

" Solarized {{{
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
hi Folded term=none cterm=none ctermfg=DarkGrey guifg=DarkGrey ctermbg=none guibg=none


" fix weired display of Sign Column Color (Signify)
if has('gui_running')
  highlight SignColumn ctermbg=white
else
  highlight SignColumn ctermbg=black
endif

if version >= 703
  set colorcolumn=100
  let g:solarized_hitrail = 1
endif

au MyAutoCmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=None ctermbg=None ctermfg=None guifg=None
au MyAutoCmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=Black ctermbg=Black ctermfg=Black guifg=Black
" TODO make this switch with TogleVisibility()

" TODO only add this to theme file for vim-indent-guides
" hi IndentGuidesOdd  ctermbg=Black
" hi IndentGuidesEven ctermbg=None

"}}}
" Toggle solarized visibility {{{
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

" }}}
" Font Size in GUI {{{
" Change font size quickly - http://vim.wikia.com/wiki/Change_font_size_quickly
if has("gui_running")
  nnoremap <leader>+ :LargerFont<cr>
  nnoremap <leader>- :SmallerFont<cr>
  let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
  let s:minfontsize = 6
  let s:maxfontsize = 16
  function! AdjustFontSize(amount)
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
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
endif

" }}}
