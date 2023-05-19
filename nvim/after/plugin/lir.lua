local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
    show_hidden_files = false,
    ignore = { "node_modules" },
    devicons = {
        enable = true,
        highlight_dirname = false
    },

    mappings = {
        ['<CR>']      = actions.edit, -- open file
        ['<C-s>'] = actions.split, -- open split
        ['<C-v>'] = actions.vsplit, -- open vsplit
        ['<C-t>'] = actions.tabedit, -- in new tab

        [']']      = actions.up, -- up dir
        ['q']      = actions.quit,

        ['/']      = actions.mkdir,
        ['%']      = actions.newfile,
        ['r']      = actions.rename,
        ['Y']      = actions.yank_path,
        ['d']      = actions.delete,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,
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

vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {"lir"},
    callback = function()
        -- use visual mode
        vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
        )
    end
})

require'lir.git_status'.setup({
    show_ignored = false
})

vim.keymap.set('n', '<C-f>', ":lua require'lir.float'.toggle() <CR>", { silent=true })
