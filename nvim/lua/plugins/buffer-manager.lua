return {
    'j-morano/buffer_manager.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<leader>o', ':lua require("buffer_manager.ui").toggle_quick_menu()<cr>', desc = '' },
    },
    config = function()
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set
        -- Setup
        require("buffer_manager").setup({
            select_menu_item_commands = {
                v = {
                    key = "<C-v>",
                    command = "vsplit"
                },
                h = {
                    key = "<C-h>",
                    command = "split"
                }
            },
            focus_alternate_buffer = false,
            short_file_names = true,
            short_term_names = true,
            loop_nav = false,
        })

        local bmui = require("buffer_manager.ui")
        local keys = '1234567890'
        for i = 1, #keys do
            local key = keys:sub(i, i)
            map(
                'n',
                string.format('<leader>%s', key),
                function() bmui.nav_file(i) end,
                opts
            )
        end
        map('n', '<leader>o', bmui.toggle_quick_menu, opts)
    end
}
