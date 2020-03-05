"		    _                        
"   __   __(_) _ __ ___   _ __   ___ 
"   \ \ / /| || '_ ` _ \ | '__| / __|
" _  \ V / | || | | | | || |   | (__ 
"(_)  \_/  |_||_| |_| |_||_|    \___|
" by dajanto

" Standard stuff
syntax enable
set encoding=utf-8
set background=dark
set autoindent
set spell
set spelllang=de
set noexpandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set hlsearch
set fileencoding=utf-8
:set number

" Current colorscheme
colorscheme solarized8

" Saving current state as session with F5
map <F5> :mksession! session.vim<ENTER>

" Load last session with F6
map <F6> :source session.vim<ENTER>

" Search
map <F7> /

" Dehighlight search results
map <F8> :noh<ENTER>

" TODO list done command
map <F4> A **********--> X <-- *****ERLEDIGT!*****<ESC>j^

" Autosaving with vim 8.0
let timer = timer_start(2000, 'SaveFile',{'repeat':-1})
func! SaveFile(timer)
  silent! :w!
endfunc