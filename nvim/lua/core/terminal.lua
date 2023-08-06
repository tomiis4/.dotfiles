-- exit insert move
vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]

-- disable numbers
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '',
    command = "setlocal nonumber norelativenumber"
})
