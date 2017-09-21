" Plugins {{{
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
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'liuchengxu/space-vim-dark'
Plug 'othree/yajs.vim'
call plug#end()

" enable deoplete for autocompletion
let g:deoplete#enable_at_startup = 1
"}}}

" Tabs, spaces, et. al. {{{
set expandtab
set shiftwidth=4
set softtabstop=4

set showmatch
set matchtime=1

" show tabs and spaces
set list
set listchars=tab:·\ ,trail:· " show trailing
" }}}

" Line and column display {{{
" show line numbers
set number

" Highlight current line
set cursorline

" add some rulers
set textwidth=120
set colorcolumn=-20,+0
" }}}

" Search & motions {{{
set ignorecase
set smartcase " case-insensitive search (except when capitals are present)
set incsearch

" make Y behave like the other capitals
map Y y$

" make C-c behave like <esc> to avoid breaking plugins
inoremap <C-c>  <Esc>

" disable mouse support.  It's sort of annoying in neovim + gnome-terminal
set mouse=
" }}}

" Styling {{{
" use true colors in terminal
set termguicolors

" use a good colorscheme
colorscheme space-vim-dark

" also use a good lightline theme to match
let g:lightline = {
  \ 'colorscheme': 'one',
\ }

" make comments italic
highlight Comment cterm=italic
" }}}

" vim:foldmethod=marker:foldlevel=0
