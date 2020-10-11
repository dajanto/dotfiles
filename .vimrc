"			_
"   __   __(_) _ __ ___   _ __   ___ 
"   \ \ / /| || '_ ` _ \ | '__| / __|
" _  \ V / | || | | | | || |   | (__ 
"(_)  \_/  |_||_| |_| |_||_|    \___|
" by dajanto


" Basic Stuff

syntax enable
set encoding=utf-8
set background=dark
set autoindent
set smartindent
set ignorecase
set smartcase
set autoread
set nobackup 
set nowritebackup 
set noswapfile
set noerrorbells 
set novisualbell
set spell
set spelllang=de_de,en_us
set noexpandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set fileencoding=utf-8
set number

" Undo related settings 
" TODO win64 vs. linux	 
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Search and find 

set wildmenu
set hidden
set path+=**
set hlsearch
set incsearch

" Search shortcut
map <F7> /

" Dehighlight search results
map <F8> :noh<ENTER>

" Global search
map <F9> :g/

" Substitute anywhere
map <F10> :%s/

" Substitute in row
map <F11> :s/


" Session

" Saving current session with F5
" map <F5> :mksession! session.vim<ENTER>

" Load last session with F6
" map <F6> :source session.vim<ENTER>


" Misc

" Get all files names in buffer
map <F1> :r !ls<ENTER>:%s/.*/mv & &/<ENTER>:noh<ENTER>gg

" Spelling
map <F2> :set spell<ENTER>
map <F3> :set nospell<ENTER>

" Todo list line finish command
map <F4> A **********--> X <--*****ERLEDIGT!*****<ESC>j^

" Insert current time and date
:nnoremap <F5> "=strftime("%c")<CR>P

" Compiling current file with pdflatex
map <F12> :silent! !(pdflatex %:t & zathura %:r.pdf & disown)<ENTER> <bar> :redraw!

" More useful tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif

call plug#begin()
Plug 'kien/ctrlp.vim'				" Searching 
Plug 'vim-airline/vim-airline'		" Status Bar
Plug 'lifepillar/vim-solarized8'	" Colorscheme solarized8 
Plug 'morhetz/gruvbox'				" Colorscheme gruvbox
call plug#end()


" Color
" colorscheme solarized8
colorscheme gruvbox


" Autosaving with VIM 8.0
" let timer = timer_start(2000, 'SaveFile',{'repeat':-1})
" func! SaveFile(timer)
"   silent! :w!
" endfunc


" GVIM specifics

" Font
if has("gui_running") 
	set guifont=Ubuntu_Mono:h18
endif
