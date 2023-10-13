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

set undofile
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


" Misc

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

call plug#begin()
" Plugins
" Plug 'vim-airline/vim-airline'		" Status Bar
Plug 'tpope/vim-surround'			" Vim Surround
Plug 'tpope/vim-repeat'				" . command for surround
Plug 'junegunn/goyo.vim'			" Distraction-free typing
Plug 'sheerun/vim-polyglot'			" Syntax Highlighting improvements and other stuff
Plug 'machakann/vim-highlightedyank' " Highlight after yank

" Colorschemes
Plug 'rebelot/kanagawa.nvim'
Plug 'gruvbox-community/gruvbox'	
Plug 'doums/darcula'
Plug 'lifepillar/vim-solarized8'
call plug#end()

" Color
colorscheme kanagawa
" colorscheme gruvbox
" colorscheme darcula
" colorscheme solarized8
