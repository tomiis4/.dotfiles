return {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
        require('gitsigns').setup {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 1000,
            }
        }

        local opts = { silent = true }
        vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk <CR>', opts)
        vim.keymap.set('n', 'gn', ':Gitsigns next_hunk <CR>', opts)
    end
}
