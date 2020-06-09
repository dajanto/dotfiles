"		    _                        
"   __   __(_) _ __ ___   _ __   ___ 
"   \ \ / /| || '_ ` _ \ | '__| / __|
" _  \ V / | || | | | | || |   | (__ 
"(_)  \_/  |_||_| |_| |_||_|    \___|
" by dajanto

"-----------------------------------------
" STANDARD STUFF

syntax enable
set encoding=utf-8
set background=dark
set autoindent
set autoread
set spell
set spelllang=de
set noexpandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set fileencoding=utf-8
set number

" Current colorscheme
colorscheme solarized8
"-----------------------------------------


"-----------------------------------------
" SEARCH

set hlsearch
set incsearch

" Search shortcut
map <F7> /

" Dehighlight search results
map <F8> :noh<ENTER>

" Global Search
map <F9> :g/

" Substitute anywhere
map <F10> :%s/

" Substitute in row
map <F11> :s/

"-----------------------------------------


"-----------------------------------------
" SESSION

" Saving current session with F5
map <F5> :mksession! session.vim<ENTER>

" Load last session with F6
map <F6> :source session.vim<ENTER>
"-----------------------------------------


"-----------------------------------------
" MISC
map <F2> :set spell<ENTER>
map <F3> :set nospell<ENTER>
map <F4> A **********--> X <-- *****ERLEDIGT!*****<ESC>j^

" Autosaving with VIM 8.0
" let timer = timer_start(2000, 'SaveFile',{'repeat':-1})
" func! SaveFile(timer)
"   silent! :w!
" endfunc
"-----------------------------------------


"-----------------------------------------
" GVIM SPECIFICS

" Font
if has("gui_running") 
	set guifont=Ubuntu_Mono:h12
endif
"-----------------------------------------
