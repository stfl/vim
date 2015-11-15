#!/bin/bash

if [ ! -e ~/.vim/autoload/plug.vim ]; then
   echo -e "\n$(color green)installing vim-plug$(color)"
   command -v curl >/dev/null 2>&1
   if [ "0" == "$?" ]; then
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   else # use wget
      mkdir -p ~/.vim/autload
      wget -P ~/.vim/autoload --no-check-certificate\
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
   fi
   ls -s ~/.vim/autoload ~/.config/nvim
fi

echo -e "\n$(color green)updateing vim Plugins$(color)"
vim +PlugUpdate +qall

if [ -e ~/.vim/fonts ]; then
   echo -e "\n$(color green)updateing powerline fonts$(color)"
   (cd ~/.vim/fonts; git pull origin master)
else
   echo -e "\n$(color green)installing powerline fonts$(color)"
   git clone https://github.com/powerline/fonts.git ~/.vim/fonts
fi
~/.vim/fonts/install.sh
