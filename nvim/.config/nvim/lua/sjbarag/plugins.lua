-- bootstrap packer.nvim 
-- https://github.com/wbthomason/packer.nvim/tree/7182f0ddbca2dd6f6723633a84d47f4d26518191#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
return require('packer').startup(function()
  -- packer itself
  use 'wbthomason/packer.nvim'

  -- utilities
  use 'neovim/nvim-lspconfig'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'tpope/vim-surround'
  use 'junegunn/goyo.vim'
  use 'editorconfig/editorconfig-vim'
  use 'theme-controller/thcon.vim'
  use 'hrsh7th/nvim-cmp' -- autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'svermeulen/vimpeccable' -- vimscript map command sugar
  use 'mfussenegger/nvim-lint' -- shell out to linters

  -- themes
  use 'itchyny/lightline.vim'
  use 'tomasr/molokai'
  use 'liuchengxu/space-vim-theme'
  use 'arcticicestudio/nord-vim'
  use 'freeo/vim-kalisi'
  use 'ayu-theme/ayu-vim'
  use 'drewtempelmeyer/palenight.vim'
  use 'srcery-colors/srcery-vim'
  use { 'challenger-deep-theme/vim', as = 'challenger-deep' }
  use { 'sonph/onehalf' }
  use { 'sainnhe/edge' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
