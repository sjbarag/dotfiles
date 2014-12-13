set number
set expandtab
set shiftwidth=4
set softtabstop=4
set laststatus=2

" The default match time is really short
set showmatch
set matchtime=1

" Case insensitive search (except when capitals present) & incremental search
set ignorecase
set smartcase
set incsearch

" Highlight current line
set cursorline

" show tabs and spaces
set list
set listchars=tab:·\ ,trail:· " show trailing

" make Y behave like the other capitals
map Y y$
"
" for pathogen!
"call pathogen#infect()
syntax on
filetype plugin indent on

set guifont=Terminus\ 8

" only use 256 colors on xterm; otherwise use a different colorscheme
set t_Co=256

colorscheme monokai
