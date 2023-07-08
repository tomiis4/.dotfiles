return {
    {
        'echasnovski/mini.surround',
        dependencies = { 'echasnovski/mini.pairs' },
        event = 'InsertEnter',
        config = function()
            require('mini.pairs').setup()
            require('mini.surround').setup({
                mappings = {
                    add = 'sa', -- Add surrounding in Normal and Visual modes
                    delete = 'sd', -- Delete surrounding
                    find = 'sf', -- Find surrounding (to the right)
                    replace = 'sc', -- Replace surrounding
                    find_left = 'sF', -- Find surrounding (to the left)
                    highlight = 'sh', -- Highlight surrounding
                },
            })
        end
    },
    {
        'echasnovski/mini.comment',
        keys = {
            { '<leader><leader>', ':lua require("mini.comment").setup()<cr>' },
            { 'gc', ':lua require("mini.comment").setup()<cr>', mode = 'v'},
        },
        config = function()
            require('mini.comment').setup(
                {
                    mappings = {
                        comment = 'gc',
                        comment_line = '<leader><leader>',
                        textobject = 'gc',
                    },
                })
        end
    }
}
