" ============
" Utils and usefull functions
" ============

" Autocommands {{{
augroup MyAutoCmd
   " Check timestamp on window enter. More eager than 'autoread'
   autocmd WinEnter * checktime

   " If session is loaded, write session file on quit
   autocmd VimLeavePre *
            \ if ! empty(v:this_session) && ! exists('g:SessionLoad')
            \ |   execute 'mksession! '.fnameescape(v:this_session)
            \ | endif

   " When editing a file, always jump to the last known cursor position.
   " Don't do it when the position is invalid or when inside an event handler
   autocmd BufReadPost *
            \ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
            \|   exe 'normal! g`"zvzz'
            \| endif

   " Disable paste and/or update diff when leaving insert mode
   autocmd InsertLeave *
            \ if &paste | setlocal nopaste mouse=a | echo 'nopaste' | endif |
         \ if &l:diff | diffupdate | endif

augroup END

" }}}
" Remove end of line white space. {{{
command! -range=% WhitespaceErase call <SID>WhitespaceErase(<line1>,<line2>)
function! s:WhitespaceErase(line1, line2)
   let l:save_cursor = getpos('.')
   silent! execute ':'.a:line1.','.a:line2.'s/\s\+$//'
   call setpos('.', l:save_cursor)
endfunction

"}}}
" Save and persist session {{{
command! -bar -complete=file -nargs=? SessionSave call s:session_save(<q-args>)
function! s:session_save(file) abort
   if ! isdirectory(g:session_directory)
      call mkdir(g:session_directory, 'p')
   endif
   let file_name = empty(a:file) ? block#project() : a:file
   let file_path = g:session_directory.file_name.'.vim'
   execute 'mksession! '.fnameescape(file_path)
   echo 'Tracking session in '.fnamemodify(file_path, ':~:.')
   let v:this_session = file_path
endfunction

" }}}
" Append modeline after last line in buffer {{{
" See: http://vim.wikia.com/wiki/Modeline_magic
command! AppendModeline call <SID>AppendModeline()
function! s:AppendModeline()
   let l:modeline = printf(' vim: set ft=%s ts=%d sw=%d tw=%d %set :',
            \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
   let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
   call append(line('$'), l:modeline)
endfunction

"}}}
" Copy search matches into a register {{{
command! -register CopyMatches call CopyMatches(<q-reg>)
function! s:CopyMatches(reg)
   let hits = []
   %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
   let reg = empty(a:reg) ? '+' : a:reg
   execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" }}}
" <C-R> replacements ;)  "{{{
" " See: http://github.com/nelstrom/vim-visual-star-search
" C-r: Easier search and replace
xnoremap <C-r> :<C-u>call VSetSearch('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
function! VSetSearch(cmdtype)
   let temp = @s
   normal! gv"sy
   let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
   let @s = temp
endfunction

"}}}
" Zoom / Restore window {{{
nnoremap <C-w>z :ZoomToggle<CR>
command! ZoomToggle call s:ZoomToggle()
function! s:ZoomToggle()
   if exists('t:zoomed') && t:zoomed > -1
      execute t:zoom_winrestcmd
      let t:zoomed = -1
   else
      let t:zoom_winrestcmd = winrestcmd()
      resize
      vertical resize
      let t:zoomed = bufnr('%')
   endif
endfunction

" }}}
" Function to Check if Version is is newer {{{
function! VerNewerThen(min, current)
" return 1 with version $current is newer then version $min
   if has('nvim')
      " neovim makes sth wierd with the string in system()
      return 1
   else
      return system("[  \"".a:min."\" = \"`echo -e \"".a:min."\\n".a:current." | sort -V | head -n1`\" ] && echo 1 || echo 0")
   endif
endfunction

" }}}
" Automatically write to remote location {{{

augroup write_remote " init the augroup
augroup END
command! -nargs=1 -complete=file WriteRemote
         \ au! write_remote BufWritePost <buffer> silent Nwrite <args>
         
" call s:auto_write_remote(<args>)

" function! s:auto_write_remote(target)
"    augroup write_remote
"       au! BufWritePost <buffer> silent Nwrite scp://.a:target
"    augroup END
" endfunction

command! WriteRemoteClear au! write_remote BufWritePost <buffer>

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" }}}

