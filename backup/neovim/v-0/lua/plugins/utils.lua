-- terminal
vim.keymap.set('n', '<leader>t', ':terminal <CR>', {})

-- exit insert move in terminal
vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]


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
}
