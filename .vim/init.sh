#!/bin/bash

if [ -e ~/.vim/bundle/Vundle.vim ]; then
   (cd ~/.vim/bundle/Vundle.vim
   git pull)
else
   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +PluginUpdate +qall

if [ -e ~/.vim/fonts ]; then
   (cd ~/.vim/fonts;
   git pull)
else
   git clone git@github.com:powerline/fonts.git ~/.vim/fonts
fi
~/.vim/fonts/install.sh
