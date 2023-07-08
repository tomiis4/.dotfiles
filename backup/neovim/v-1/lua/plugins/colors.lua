return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            variant = 'main',
            dark_variant = 'main',
            dim_nc_background = false,
            disable_background = true,
            disable_float_background = true,
            disable_italics = false,
        })

        -- Set colorscheme after options
        vim.cmd('colorscheme rose-pine')


        -- markdown syntax
        vim.cmd [[let g:markdown_fenced_languages = ['ts=typescript', 'js=javascript', 'lua', 'c'] ]]

        -- highlight
        vim.cmd [[:highlight GitSignsAdd guibg=NONE]]
        vim.cmd [[:highlight GitSignsChange guibg=NONE]]
        vim.cmd [[:highlight GitSignsDelete guibg=NONE]]
    end,
}
