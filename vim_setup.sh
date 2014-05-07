#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0);pwd)
USER_DIR=~

cp -p ${DOTFILES_DIR}/.vimrc ${USER_DIR}/

mkdir -p ${USER_DIR}/.vim/indent
cp -p ${DOTFILES_DIR}/.vim/indent/* ${USER_DIR}/.vim/indent/

mkdir -p ${USER_DIR}/.vim/bundle
cd ${USER_DIR}/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim

#mkdir -p $HOME/.vim/ftdetect
#mkdir -p $HOME/.vim/syntax
#mkdir -p $HOME/.vim/autoload/go
#ln -s /usr/local/Cellar/go/1.2/libexec/misc/vim/ftdetect/gofiletype.vim $HOME/.vim/ftdetect/
#ln -s /usr/local/Cellar/go/1.2/libexec/misc/vim/syntax/go.vim $HOME/.vim/syntax/
#ln -s /usr/local/Cellar/go/1.2/libexec/misc/vim/autoload/go/complete.vim $HOME/.vim/autoload/go
