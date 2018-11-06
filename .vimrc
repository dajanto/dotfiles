set encoding=utf-8
set background=dark
set t_Co=256
colorscheme monokai
syntax enable
set fileencoding=utf-8
:set number
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set hlsearch

fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()
