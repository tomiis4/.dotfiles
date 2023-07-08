return {
    'brenoprata10/nvim-highlight-colors',
    keys = {
        { '<leader>c', ':lua require("nvim-highlight-colors").toggle()<CR>', desc = '' },
    },
    config = function()
        vim.cmd [[ set t_Co=256 ]]

        require('nvim-highlight-colors').setup {
            render = 'foreground',
        }

        vim.keymap.set(
            'n',
            '<leader>c',
            ':lua require("nvim-highlight-colors").toggle()<CR>',
            { silent = true }
        )
    end
}
