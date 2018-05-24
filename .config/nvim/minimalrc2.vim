
set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/Shougo/deoplete.nvim
set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/ujihisa/neco-look
let g:deoplete#enable_at_startup = 1

if has('vim_starting')
   source $HOME/.config/nvim/start.vim
   if has('nvim')
      source $HOME/.config/nvim/start_nvim.vim
   endif
endif

" set dictionary=/usr/share/dict/words

source ~/.config/nvim/general.vim
source ~/.config/nvim/utils.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/filetypes.vim

source ~/.config/nvim/deoplete.vim

set spell
