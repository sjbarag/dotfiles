-- tabs and spaces
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.o.showmatch = true
vim.o.matchtime = 1

vim.o.list = true
vim.cmd([[set listchars=tab:·\ ,trail:· " show trailing]])

vim.o.number = true
vim.o.cursorline = true

vim.o.textwidth = 120
vim.o.colorcolumn = '-20,+0'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

local vimp = require('vimp')

vim.o.clipboard = vim.o.clipboard .. 'unnamed'

vimp.inoremap('<C-c>', '<Esc>')

vim.o.mouse = ''

vim.cmd([[
  augroup filetypedetect
    autocmd BufRead,BufNewFile *.msg set filetype=mail
    autocmd BufRead,BufNewFile *.msg set tw=72
    autocmd BufRead,BufNewFile *.msg set spell

    " always enable spell-checking in commit messages
    autocmd FileType gitcommit set spell

    " use tabs instead of spaces for go
    autocmd FileType go set noexpandtab tabstop=4 shiftwidth=0
  augroup END
]])
