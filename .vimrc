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
set virtualedit=all
set visualbell
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/rename'
Plugin 'vim-scripts/confirm-quit'
call vundle#end()
filetype plugin indent on
autocmd BufEnter *.hs set formatprg=hindent
let g:bufExplorerDisableDefaultKeyMapping=1
noremap <leader>b :ToggleBufExplorer<cr>
noremap <leader>t :NERDTreeToggle<cr>
