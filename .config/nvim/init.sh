#!/bin/bash

# if [ ! -e ~/.vim/autoload/plug.vim ]; then
   # echo -e "\n$(color green)installing vim-plug$(color)"
   # command -v curl >/dev/null 2>&1
   # if [ "0" == "$?" ]; then
      # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   # else # use wget
      # mkdir -p ~/.vim/autload
      # wget -P ~/.vim/autoload --no-check-certificate\
         # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   # fi
   # ls -s ~/.vim/autoload ~/.config/nvim
# fi

echo -e "\n$(color green)Installing NeoBundle$(color)"
if command -v curl &>/dev/null; then
   curl -o ~/.config/nvim/neobundleinstall.sh \
      https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
else
   wget -O ~/.config/nvim/neobundleinstall.sh --no-check-certificate \
      https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
fi
sh ~/.config/nvim/neobundleinstall.sh

if [ ! -e ~/.config/nvim/bundle/vimproc.vim ]; then
   git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
   (cd ~/.config/nvim/bundle/vimproc.vim; make)
fi

echo -e "\n$(color green)updateing vim Plugins$(color)"
vim +NeoBundleInstall +qall

if [ -e ~/.vim/fonts ]; then
   echo -e "\n$(color green)updateing powerline fonts$(color)"
   (cd ~/.vim/fonts; git pull origin master)
else
   echo -e "\n$(color green)installing powerline fonts$(color)"
   git clone https://github.com/powerline/fonts.git ~/.vim/fonts
fi
~/.vim/fonts/install.sh
