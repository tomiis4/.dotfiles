return {
    {
        -- tomiis4/hypersonic.nvim
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
        -- tomiis4/BufferTabs.nvim
        dir = 'C:\\Programming\\Lua\\BufferTabs.nvim',
        config = function()
            require('buffertabs').setup({
                horizontal = 'right',
                vertical = 'bottom'
            })
        end
    }
}
