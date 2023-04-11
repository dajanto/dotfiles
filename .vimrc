" Basic Stuff
syntax enable
set encoding=utf-8
set background=dark
set autoindent
set smartindent
set ignorecase
set termguicolors
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
set cursorline
set fileencoding=utf-8
set number
set scrolloff=8

" If undo directory doesn't exist, create it
if empty(glob('~/.vim/undo'))
	silent !mkdir ~/.vim/undo >/dev/null 2>&1
endif

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " Where to save undo histories
set undolevels=100000       " How many undos
set undoreload=100000       " Number of lines to save for undo

" Search and find 
set wildmenu
set hidden
set path+=**
set hlsearch
set incsearch

" Leader definition
let mapleader = "q"

" Search shortcut
map <space> /

" Forward-Search word under cursor
map # *N

" Disable Ex-Mode and rebind macro key
nnoremap Q q
nnoremap q <Nop>

" End of line copy
nnoremap Y yg_

" Center screen after searching next
nnoremap n nzzzv

" Center screen after searching previous
nnoremap N Nzzzv

" Center screen after line join
nnoremap J mzJ`z

" Multiple p inserts in a row
xnoremap p "_dP

" Improve Ergodox ergonomics
map <PageUp> <C-u>
map <PageDown> <C-d>

" Easier parenthesis access on German layout
set langmap=äöÄÖ;{}[]

" Dehighlight search results
map <F9> :nohlsearch<ENTER>

" Copy entire document or everything but first line (leetcode php)
nnoremap <leader>Y ggj"+yG
nnoremap <leader>X gg"+yG

" Copy and pasting with + register
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Git status
nnoremap <leader>s :Git status<ENTER>

" Git diff
nnoremap <leader>d :Git diff<ENTER>

" Git add
nnoremap <leader>a :Git add

" Git add all
nnoremap <leader>A :Git add --all<ENTER>

" Git add updated
nnoremap <leader>u :Git add -u<ENTER>

" Git commit 
nnoremap <leader>c :Git commit<ENTER>

" Git push
nnoremap <leader>C :Git push<ENTER>

" Git reset 
nnoremap <leader>r :Git reset

" Git reset --hard
nnoremap <leader>R :Git reset --hard<ENTER>

" Misc

" Get all files names in buffer
map <F1> :r !ls<ENTER>:%s/.*/mv & &/<ENTER>:nohlsearch<ENTER>gg

" Spelling
map <F2> :set spell<ENTER>
map <F3> :set nospell<ENTER>

map <F4> A✔️<ESC>j^

" Insert current time and date
nnoremap <F5> "=strftime("%c")<CR>P<ENTER>

" Line substitution
map <F6> :s/

" File substitution
map <F7> :%s/


" Compiling current file with pdflatex silently
" TODO needs rework
" map <F12> :silent! !(pdflatex %:t & zathura %:r.pdf & disown)<ENTER> <bar> :redraw!
" au FileType tex map <silent> <expr> <F12> system("pdflatex ".expand("%"))

if !has('win32')
	" Install vim-plug if not found (*nix only)
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

call plug#begin()
" Plugins
Plug 'vim-airline/vim-airline'		" Status Bar
Plug 'tpope/vim-surround'			" Vim Surround
Plug 'tpope/vim-fugitive'			" Git integration
Plug 'tpope/vim-repeat'				" . command for surround
Plug 'junegunn/goyo.vim'			" Distraction-free typing
Plug 'sheerun/vim-polyglot'			" Syntax Highlighting improvements and other stuff

" Colorschemes
Plug 'gruvbox-community/gruvbox'	
Plug 'doums/darcula'
Plug 'lifepillar/vim-solarized8'
call plug#end()

" Color
colorscheme gruvbox
" colorscheme darcula
" colorscheme solarized8


" GVIM specifics

" Font
if has("gui_running") 

	" set guifont=Ubuntu_Mono:h18
	set guifont=Droid_Sans_Mono:h16

	" No bars
	set guioptions -=m
	set guioptions -=T
endif

