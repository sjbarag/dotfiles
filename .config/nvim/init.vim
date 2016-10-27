function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'scrooloose/syntastic'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'freeo/vim-kalisi'
call plug#end()

set number
set expandtab
set shiftwidth=4
set softtabstop=4

set showmatch
set matchtime=1

set ignorecase
set smartcase " case-insensitive search (except when capitals are present)
set incsearch

" Highlight current line
set cursorline

" show tabs and spaces
set list
set listchars=tab:·\ ,trail:· " show trailing

" make Y behave like the other capitals
map Y y$

" disable mouse support.  It's sort of annoying in neovim + gnome-terminal
set mouse=

" enable deoplete for autocompletion
let g:deoplete#enable_at_startup = 1

" use true colors in terminal
set termguicolors

" default to a dark background
set background=dark

" use a good colorscheme
colorscheme kalisi
