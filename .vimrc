"
" dajantos
"			_
"   __   __(_) _ __ ___   _ __   ___ 
"   \ \ / /| || '_ ` _ \ | '__| / __|
" _  \ V / | || | | | | || |   | (__ 
"(_)  \_/  |_||_| |_| |_||_|    \___|

" Strange characters fix on Mint Thinkpad 
if has("unix") 
	let &t_TI = ""
	let &t_TE = ""
endif

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

" TODO list line finish command
map <F4> A **********--> X <--*****ERLEDIGT!*****<ESC>j^

" Insert current time and date
nnoremap <F5> "=strftime("%c")<CR>P

" Compiling current file with pdflatex silently
" TODO needs rework
" map <F12> :silent! !(pdflatex %:t & zathura %:r.pdf & disown)<ENTER> <bar> :redraw!
" au FileType tex map <silent> <expr> <F12> system("pdflatex ".expand("%"))

" Install vim-plug if not found (*nix only)
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
" Plugins
Plug 'vim-airline/vim-airline'		" Status Bar
Plug 'tpope/vim-surround'			" Vim Surround
Plug 'tpope/vim-fugitive'			" Git integration
Plug 'tpope/vim-repeat'				" . command for surround
Plug 'junegunn/goyo.vim'			" Distraction-free typing
Plug 'mboughaba/i3config.vim'       " i3 syntax highlighting
Plug 'sheerun/vim-polyglot'			" Syntax Highlighting improvements and other stuff
Plug 'easymotion/vim-easymotion'	" Better motions
Plug 'tpope/vim-commentary'			" Commentary binds

" Colorschemes
Plug 'gruvbox-community/gruvbox'	
Plug 'lifepillar/vim-solarized8'
Plug 'doums/darcula'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" Keep leading zeros with fugitive
let g:airline#extensions#fugitiveline#enabled = 0

" Color
" colorscheme darcula
" colorscheme gruvbox
" colorscheme solarized8
"colorscheme papercolor
"colorscheme nord-vim
colorscheme palenight


" GVIM specifics

" Font
if has("gui_running") 

	" set guifont=Ubuntu_Mono:h18
	set guifont=Droid_Sans_Mono:h16

	" No bars
	set guioptions -=m
	set guioptions -=T
endif
