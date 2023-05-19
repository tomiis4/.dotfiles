require('gitsigns').setup{ 
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 1000,
    }
}

vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk <CR>', {})
vim.keymap.set('n', 'gn', ':Gitsigns next_hunk <CR>', {})
