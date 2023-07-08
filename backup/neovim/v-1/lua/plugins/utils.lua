-- terminal
vim.keymap.set('n', '<leader>t', ':terminal <CR>', {})

-- exit insert move in terminal
vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]

-- disable numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '',
    command = "setlocal nonumber norelativenumber"
})


return {
    {
        'wakatime/vim-wakatime',
        event = "InsertEnter",
    },
    {
        'dstein64/vim-startuptime',
        cmd = "StartupTime",
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        dir = 'C:\\Programming\\Lua\\Hypersonic.nvim',
        --config = true,
        config = function()
            require('hypersonic').setup({
                add_padding = false,
                hl_group = 'boolean',
                wrapping = ''
            })

            vim.keymap.set('v', '<leader>r', ":Hypersonic <CR>", { silent = true })
        end
    },
    {
        'lukas-reineke/virt-column.nvim',
        event = "BufEnter",
        config = function ()
            require("virt-column").setup()
        end
    },
--     {
--         'nyngwang/NeoWell.lua',
--         config = function()
--             require('neo-well').setup {
--                 height = 10
--             }
--
--             vim.keymap.set('n', '<leader>b', ':NeoWellToggle <CR>', { silent = true })
--             vim.keymap.set('n', '<leader>a', ':NeoWellAppend <CR>', { silent = true })
--             vim.keymap.set('n', '<Tab>', function ()
--   -- vim.cmd('NeoZoomToggle') -- remove this if you don't know what it is
--   vim.cmd('NeoWellJump')
-- end, { noremap = true, silent = true, nowait = true })
--         end
--     }
}
