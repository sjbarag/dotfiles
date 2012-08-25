set number
set shiftwidth=4
set laststatus=2
set ts=4
set colorcolumn=81
"set autoindent

set showmatch
set matchtime=1

" Case insensitive search, except when capitals present & search-as-you-type
set ignorecase
set smartcase
set incsearch

" Highlight current line
set cursorline

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" line wrapping
set lbr
let &showbreak = ' >> '

set list
set listchars=tab:·\ ,trail:· " show trailing

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up>   <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" make Y behave like the other capitals
map Y y$


" hardcopy!
set printfont=terminus
set printoptions=paper:letter,right:36pt,left:36pt,number:y,wrap:y " 36pt = .5in

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Linux clipboard support
let g:clipbrdDefaultReg = '+'

" Space will toggle folds!
nnoremap <space> za

" write file as sudo
cmap w!! %!sudo tee > /dev/null %

" remap F1 to escape, because the F1 help screen is annoying
map <F1> <Esc>
imap <F1> <Esc>

" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" enable spell checking and remove color column for .tex files
autocmd FileType tex
\ setlocal spell
\ | setlocal cc=0

" enable spell checking for .txt files
" NOTE: since vim doesn't have a filetype for .txt, this recognizes .txt extensions
autocmd BufNewFile,BufRead *.txt setlocal spell
autocmd BufNewFile,BufRead *.tex setlocal filetype=tex
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" for pathogen!
call pathogen#infect()
syntax on
filetype plugin indent on

" powerline!
"let g:Powerline_symbols = 'fancy'

set guifont=Terminus\ 8

" only use 256 colors on xterm; otherwise use a different colorscheme
if $COLORTERM == 'xterm-256color'
	set t_Co=256
endif
color molokai
