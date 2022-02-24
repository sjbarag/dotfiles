vim.o.termguicolors = true

vim.g.lightline = { colorscheme = 'one' }

vim.cmd([[call thcon#load()]])
vim.cmd([[call thcon#listen()]])

vim.cmd([[highlight Comment cterm=italic]])
