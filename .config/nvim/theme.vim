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

" Toggle solarized visibility {{{
nnoremap <F7> :call TogleVisibility()<CR>
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

" }}}
" Nicer fold text {{{
" See: http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! FoldText() "{{{
   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
   let lines_count = v:foldend - v:foldstart + 1
   let lines_count_text = '| ' . printf('%10s', lines_count . ' lines') . ' |'
   let foldchar = matchstr(&fillchars, 'fold:\zs.')
   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
   let foldtextend = lines_count_text . repeat(foldchar, 8)
   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction "}}}
set foldtext=FoldText()

set fillchars=vert:│,fold:-
set listchars=tab:\┆\ ,eol:¬,extends:⟫,precedes:⟪,nbsp:.,trail:·

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
