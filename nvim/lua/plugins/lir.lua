return {
    'tamago324/lir.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<C-f>', ":lua require 'lir.float'.init() <CR>" }
    },
    config = function()
        local actions = require 'lir.actions'

        require 'lir'.setup {
            show_hidden_files = false,
            ignore = { "node_modules" },
            devicons = {
                enable = true,
                highlight_dirname = true
            },

            mappings = {
                ['<CR>']  = actions.edit, -- open file
                ['<C-h>'] = actions.split, -- open split
                ['<C-v>'] = actions.vsplit, -- open vsplit

                ['p']     = actions.up, -- up dir
                ['q']     = actions.quit,

                ['/']     = actions.mkdir,
                ['%']     = actions.newfile,
                ['r']     = actions.rename,
                ['Y']     = actions.yank_path,
                ['d']     = actions.delete,
            },
            float = {
                winblend = 0,
                win_opts = function()
                    return {
                        border = {
                            "╭", "─", "╮", "│", "╯", "─", "╰", "│",
                        },
                    }
                end,
            },
            hide_cursor = true
        }

        vim.keymap.set('n', '<C-f>', ":lua require'lir.float'.toggle() <CR>", { silent = true })
    end
}
