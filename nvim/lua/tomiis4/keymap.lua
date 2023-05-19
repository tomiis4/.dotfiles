local keyset = vim.keymap.set

vim.g.mapleader = ' '

-- move window
keyset("n", "<leader>k", ":wincmd k <CR>", {})
keyset("n", "<leader>j", ":wincmd j <CR>", {})
keyset("n", "<leader>h", ":wincmd h <CR>", {})
keyset("n", "<leader>l", ":wincmd l <CR>", {})

-- bufferline
keyset('n', 'cl', ':bn <CR>', {})
keyset('n', 'ch', ':bp <CR>', {})
keyset('n', 'cc', ':bdelete! <CR>', {})

-- NOH automatical
keyset('n', 'mm', ':nohlsearch <CR>', {})

-- exit insert move in terminal
vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]

-- change " to '
keyset('n', 'r\'', ':%s/"/\'/g <CR>', {})
