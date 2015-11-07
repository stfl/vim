#!/bin/bash

if [ ! -e ~/.vim/autoload/plug.vim ]; then
   command -v curl >/dev/null 2>&1
   if [ "0" == "$?" ]; then
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   else # use wget
      mkdir -p ~/.vim/autload
      wget -P ~/.vim/autoload \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
   fi
   ls -s ~/.vim/autoload ~/.config/nvim
fi

# if [ -e ~/.vim/bundle/Vundle.vim ]; then
   # (cd ~/.vim/bundle/Vundle.vim
   # git pull)
# else
   # git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# fi
vim +PlugUpgrade +PlugUpdate +qall

if [ -e ~/.vim/fonts ]; then
   (cd ~/.vim/fonts; git pull origin master)
else
   git clone https://github.com/powerline/fonts.git ~/.vim/fonts
fi
~/.vim/fonts/install.sh
