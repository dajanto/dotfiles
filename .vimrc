syntax enable
set encoding=utf-8
set fileencoding=utf-8
:set number
execute pathogen#infect()
call pathogen#helptags()
colorscheme gruvbox 
set background=dark
autocmd vimenter * NERDTree
set runtimepath^=~/.vim/bundle/ctrlp.vim
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set relativenumber
