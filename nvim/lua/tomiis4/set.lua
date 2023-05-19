-- display
vim.opt.number           = true
vim.opt.relativenumber   = true
vim.opt.termguicolors    = true
vim.opt.cursorline       = false
vim.cmd('language en_US')
vim.cmd('syntax on')

local width=4
vim.opt.tabstop       = width
vim.opt.softtabstop   = width
vim.opt.shiftwidth    = width
vim.opt.expandtab     = true

vim.opt.smartindent   = true

vim.opt.swapfile      = false
vim.opt.backup        = false
vim.opt.undofile      = true

vim.opt.showtabline=2
vim.opt.laststatus=2
