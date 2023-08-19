return {
    'rose-pine/neovim',
    name = 'rosepine',
    lazy = false,
    priority = 1000,
    init = function()
        require('rose-pine').setup({
            variant = 'main',
            disable_background = false,
            disable_float_background = true,
        })

        -- Set colorscheme after options
        vim.cmd('colorscheme rose-pine')
    end
}
