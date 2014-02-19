#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0);pwd)
USER_DIR=~

cp -p ${DOTFILES_DIR}/.vimrc ${USER_DIR}/

mkdir -p ${USER_DIR}/.vim/bundle
cd ${USER_DIR}/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim

