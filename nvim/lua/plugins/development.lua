return {
    {
        -- 'tomiis4/hypersonic.nvim',
        dir = 'C:\\Programming\\Lua\\Hypersonic.nvim',
        event = "VeryLazy",
        config = function()
            require("hypersonic").setup({
                add_padding = false,
                hl_group = 'Boolean',
                wrapping = '',
                enable_cmdline = false
            })

            vim.keymap.set('v', '<leader>r', ":Hypersonic <CR>", { silent = true })
        end,
    },
    {
        -- 'tomiis4/BufferTabs.nvim',
        dir = 'C:\\Programming\\Lua\\BufferTabs.nvim',
        -- cond = false,
        config = function()
            require('buffertabs').setup({
                display = 'column',
                horizontal = 'right',
                vertical = 'bottom',
            })

            vim.keymap.set('n', '<leader>b', ":lua require'buffertabs'.toggle() <cr>", {
                silent = true
            })
        end
    }
}
