"			_
"   __   __(_) _ __ ___   _ __   ___ 
"   \ \ / /| || '_ ` _ \ | '__| / __|
" _  \ V / | || | | | | || |   | (__ 
"(_)  \_/  |_||_| |_| |_||_|    \___|
" by dajanto

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

" Undo related settings 
" If undo directory doesn't exist, create it
if empty(glob('~/.vim/undo'))
	silent !mkdir ~/.vim/undo >/dev/null 2>&1
endif

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " Where to save undo histories
set undolevels=10000        " How many undos
set undoreload=10000        " Number of lines to save for undo

" Search and find 
set wildmenu
set hidden
set path+=**
set hlsearch
set incsearch

" Search shortcut
map <space> /

" Dehighlight search results
map <F9> :nohlsearch<ENTER>

" Session

" Saving current session with F5
" map <F5> :mksession! session.vim<ENTER>

" Load last session with F6
" map <F6> :source session.vim<ENTER>


" Misc

" Get all files names in buffer
map <F1> :r !ls<ENTER>:%s/.*/mv & &/<ENTER>:nohlsearch<ENTER>gg

" Spelling
map <F2> :set spell<ENTER>
map <F3> :set nospell<ENTER>

" TODO list line finish command
" map <F4> A **********--> X <--*****ERLEDIGT!*****<ESC>j^
"
" Insert current time and date
nnoremap <F5> "=strftime("%c")<CR>P

" Compiling current file with pdflatex silently
map <F12> :silent! !(pdflatex %:t & zathura %:r.pdf & disown)<ENTER> <bar> :redraw!
" au FileType tex map <silent> <expr> <F12> system("pdflatex ".expand("%"))

" More useful tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Remember old yank after paste
" nnoremap p "0p
" vnoremap p "_dP

" Stop vim from auto commenting on o or O 
set formatoptions-=o

" Forward-Search word under cursor
map # *N

" Disable Ex-Mode
nnoremap Q <Nop>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Finder
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'		" Status Bar
Plug 'tpope/vim-surround'			" Vim Surround
Plug 'junegunn/goyo.vim'			" Distraction-free typing
Plug 'sheerun/vim-polyglot'			" Syntax Highlighting improvements and other stuff

" Colorschemes
Plug 'gruvbox-community/gruvbox'	
Plug 'lifepillar/vim-solarized8'
Plug 'doums/darcula'
call plug#end()


" Color
" colorscheme darcula
colorscheme gruvbox
" colorscheme solarized8


" GVIM specifics

" Font
if has("gui_running") 

	" set guifont=Ubuntu_Mono:h18
	set guifont=Droid_Sans_Mono:h12

	" No bars
	set guioptions -=m
	set guioptions -=T
endif

" Compton Transparency
" autocmd VimEnter * hi Normal ctermbg=none
