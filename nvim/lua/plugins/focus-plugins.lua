return {
    {
        "Pocco81/true-zen.nvim",
        keys = {
            { '<leader>fc', ':TZAtaraxis <CR>' }
        },
        config = function()
            require("true-zen").setup()
        end,
    },
    {
        'JellyApple102/easyread.nvim',
        keys = {
            { '<leader>b', ':EasyreadToggle <CR>' }
        },
        config = function()
            vim.api.nvim_set_hl(0, 'Bold', { bold = true })

            require('easyread').setup {
                hlgroupOptions = { link = 'Bold' },
                fileTypes = {},
            }
        end
    }
}
