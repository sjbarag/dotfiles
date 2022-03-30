require('lint').linters_by_ft = {
  javascript = { 'eslint' },
  javascriptreact = { 'eslint' },
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
  typescriptcommon = { 'eslint' },
}

-- automatically lint, if possible
vim.cmd([[
  au BufWritePost <buffer> lua require('lint').try_lint()
]])
