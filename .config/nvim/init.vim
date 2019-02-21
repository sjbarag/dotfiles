" Plugins {{{
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/syntastic'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'othree/yajs.vim'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/space-vim-dark'
Plug 'chooh/brightscript.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
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

" use a good lightline theme to match the color scheme
" let g:lightline = {
"   \ 'colorscheme': 'nord',
" \ }

" nord's default comments are way too light - brighten them up a bit
" let g:nord_comment_brightness = 12

" use a dark color for ayu
let ayucolor="dark"

" use a good colorscheme
colorscheme ayu

" make comments italic
highlight Comment cterm=italic
" }}}

" vim:foldmethod=marker:foldlevel=0
