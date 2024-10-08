vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.cmd('language en_US')
vim.cmd('syntax on')

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.showtabline = 2

vim.opt.colorcolumn = "80"

vim.opt.title = true
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        local name = vim.api.nvim_buf_get_name(0):match('[^\\/]+$') or '[No Name]'
        vim.opt.titlestring = ' ' .. name
    end
})

vim.opt.shell = "nu.exe"
