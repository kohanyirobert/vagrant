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
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/rename'
Plugin 'vim-scripts/confirm-quit'
Plugin 'tpope/vim-surround'
Plugin 'ledger/vim-ledger'
Plugin 'jamessan/vim-gnupg'
Plugin 'dbeniamine/todo.txt-vim'
call vundle#end()
filetype plugin indent on
noremap <leader>o o<esc>
noremap <leader>O O<esc>
autocmd bufenter *.hs set formatprg=hindent
let g:bufExplorerDisableDefaultKeyMapping=1
noremap <silent> <leader>b :ToggleBufExplorer<cr>
noremap <silent> <leader>t :NERDTreeToggle<cr>
let g:ledger_decimal_sep=' '
let g:ledger_align_at=60
let g:ledger_default_commodity='HUF'
let g:ledger_commodity_before=0
let g:ledger_commodity_sep=' '
au FileType ledger inoremap <silent> <tab> <c-r>=ledger#autocomplete_and_align()<cr>
au FileType ledger vnoremap <silent> <tab> :LedgerAlign<cr>
