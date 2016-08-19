" call dein#add('Shougo/vimproc.vim', {
" \ 'build' : {
" \     'windows' : 'tools\\update-dll-mingw',
" \     'cygwin' : 'make -f make_cygwin.mak',
" \     'mac' : 'make',
" \     'linux' : 'make',
" \     'unix' : 'gmake',
" \    },
" \ })
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/unite.vim')

call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neoyank.vim')
