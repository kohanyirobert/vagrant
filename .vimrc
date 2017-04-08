set nocompatible
set backspace=eol,start,indent
set number
set encoding=utf8
set fileencoding=utf8
set fileformat=unix
set laststatus=2
set list
set listchars=eol:$,tab:>-,trail:-
set expandtab
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tell-k/vim-autopep8'
call vundle#end()
filetype plugin indent on 
