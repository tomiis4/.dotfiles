vim.keymap.set('n', '<leader>t', ':terminal <CR>', {})

-- exit insert move in terminal
vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]
