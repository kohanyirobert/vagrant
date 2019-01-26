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
Plugin 'tpope/vim-surround'
Plugin 'ledger/vim-ledger'
Plugin 'jamessan/vim-gnupg'
call vundle#end()
filetype plugin indent on
autocmd BufEnter *.hs set formatprg=hindent
let g:bufExplorerDisableDefaultKeyMapping=1
noremap <leader>b :ToggleBufExplorer<cr>
noremap <leader>t :NERDTreeToggle<cr>
let g:ledger_decimal_sep=' '
let g:ledger_align_at=60
let g:ledger_default_commodity='HUF'
let g:ledger_commodity_before=0
let g:ledger_commodity_sep=' '
au FileType ledger inoremap <silent> <tab> <c-r>=ledger#autocomplete_and_align()<cr>
au FileType ledger vnoremap <silent> <tab> :LedgerAlign<cr>
