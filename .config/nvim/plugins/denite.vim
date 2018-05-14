" -----------
" Denite config
" -----------
" https://github.com/rafi/vim-config/blob/master/config/plugins/denite.vim

" INTERFACE
call denite#custom#option('_', {
   \ 'prompt': '❯',
	\ 'empty': 0,
	\ 'winheight': 16,
	\ 'short_source_names': 1,
	\ 'vertical_preview': 1,
\ })

hi link deniteMatchedChar Special

" " disable devicons for denite because it's slow
" let g:webdevicons_enable_denite = 0

call denite#custom#option('list', {})

" MATCHERS
" Default is 'matcher_fuzzy'
if has('nvim') && &runtimepath =~# '\/cpsm'
	call denite#custom#source(
		\ 'buffer,file_mru,file_old,file_rec,grep,mpc,line',
		\ 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
endif

" SORTERS
" Default is 'sorter_rank'
call denite#custom#source('z', 'sorters', ['sorter_z'])

" CONVERTERS
" Default is none
call denite#custom#source(
	\ 'buffer,file_mru,file_old',
	\ 'converters', ['converter_relative_word'])


" FIND and GREP COMMANDS

if executable('rg')
   call denite#custom#var('file_rec', 'command',
            \ ['rg', '--files', '--glob', '!.git', '!.svn', ''])

   call denite#custom#var('grep', 'command', ['rg'])
   call denite#custom#var('grep', 'default_opts',
            \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
   call denite#custom#var('grep', 'recursive_opts', [])
   call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
   call denite#custom#var('grep', 'separator', ['--'])
   call denite#custom#var('grep', 'final_opts', [])

elseif executable('ag')
	" The Silver Searcher
	call denite#custom#var('file_rec', 'command',
		\ ['ag', '-U', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])

	" Setup ignore patterns in your .agignore file!
	" https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage

	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'default_opts',
		\ [ '--vimgrep', '--smart-case', '--hidden' ])

elseif executable('ack')
	" Ack command
	call denite#custom#var('grep', 'command', ['ack'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', ['--match'])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'default_opts', ['-H',
			\ '--nopager', '--nocolor', '--nogroup', '--column'])
			" \ ['--ackrc', $HOME.'/.config/ackrc', '-H',
endif

" KEY MAPPINGS
let insert_mode_mappings = [
	\  ['jk', '<denite:enter_mode:normal>', 'noremap'],
	\  ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
	\  ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
	\  ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
	\  ['<Up>', '<denite:assign_previous_text>', 'noremap'],
	\  ['<Down>', '<denite:assign_next_text>', 'noremap'],
	\  ['<C-L>', '<denite:redraw>', 'noremap'],
	\ ]

let normal_mode_mappings = [
	\   ["'", '<denite:toggle_select_down>', 'noremap'],
	\   ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
	\   ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
	\   ['gg', '<denite:move_to_first_line>', 'noremap'],
	\   ['r', '<denite:redraw>', 'noremap'],
\ ]
	" \   ['st', '<denite:do_action:tabopen>', 'noremap'],
	" \   ['sg', '<denite:do_action:vsplit>', 'noremap'],
	" \   ['sv', '<denite:do_action:split>', 'noremap'],
	" \   ['sc', '<denite:quit>', 'noremap'],

for m in insert_mode_mappings
	call denite#custom#map('insert', m[0], m[1], m[2])
endfor
for m in normal_mode_mappings
	call denite#custom#map('normal', m[0], m[1], m[2])
endfor

