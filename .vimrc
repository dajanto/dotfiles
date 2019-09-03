set encoding=utf-8
set background=dark
colorscheme solarized8
syntax enable
set fileencoding=utf-8
:set number
set autoindent
set spell
set spelllang=de
set noexpandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set hlsearch
map <f5> :mksession! session.vim
map <f6> :source session.vim

let timer = timer_start(2000, 'SaveFile',{'repeat':-1})
func! SaveFile(timer)
  silent! :w!
endfunc
