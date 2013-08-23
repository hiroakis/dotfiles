#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0);pwd)
USER_DIR=~

cp -p ${DOTFILES_DIR}/.vimrc ${USER_DIR}/

mkdir -p ${USER_DIR}/.vim/autoload
cd ${USER_DIR}/.vim/autoload
git clone https://github.com/tpope/vim-pathogen.git

cd ${USER_DIR}/.vim/bundle
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/thinca/vim-quickrun.git
git clone https://github.com/Shougo/unite.vim.git
git clone https://github.com/vim-scripts/grep.vim.git
git clone https://github.com/scrooloose/nerdcommenter.git

