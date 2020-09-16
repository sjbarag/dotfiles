" Plugins {{{
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/syntastic'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'othree/yajs.vim'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/space-vim-theme'
Plug 'sjbarag/brightscript.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'freeo/vim-kalisi'
Plug 'junegunn/goyo.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jan-warchol/selenized', { 'rtp': 'vim/' }
Plug 'srcery-colors/srcery-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'editorconfig/editorconfig-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" enable deoplete for autocompletion
let g:deoplete#enable_at_startup = 1

" configure languageclient-nvim

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'c': ['/usr/bin/clangd-10'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio']
    \ }


" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> gh <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

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

" unify system and vim pasteboards
set clipboard+=unnamed

" make C-c behave like <esc> to avoid breaking plugins
inoremap <C-c>  <Esc>

" disable mouse support.  It's sort of annoying in neovim + gnome-terminal
set mouse=
" }}}

" Filetypes {{{
augroup filetypedetect
    autocmd BufRead,BufNewFile *.msg set filetype=mail
    autocmd BufRead,BufNewFile *.msg set tw=72
    autocmd BufRead,BufNewFile *.msg set spell
augroup END
" }}}

" Styling {{{
" use true colors in terminal
set termguicolors

" use a good lightline theme to match the color scheme
let g:lightline = { 'colorscheme': 'onehalfdark' }

" let g:lightline = { 'colorscheme': 'challenger_deep' }

" use terminal colors instead of getting it close with 256-color support
" let g:challenger_deep_termcolors = 16

" nord's default comments are way too light - brighten them up a bit
" let g:nord_comment_brightness = 12

" use a dark color for ayu
" let ayucolor="dark"

" use a good colorscheme
" set background=dark
colorscheme onehalfdark

" make comments italic
highlight Comment cterm=italic
" }}}

" vim:foldmethod=marker:foldlevel=0
