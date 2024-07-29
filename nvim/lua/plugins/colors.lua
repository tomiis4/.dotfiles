return {
    -- 'mcchrish/zenbones.nvim',
    -- dependencies = {
    --     'rktjmp/lush.nvim'
    -- },
    -- init = function()
    --     vim.cmd('colorscheme neobones')
    -- end

    -- 'wadackel/vim-dogrun',
    -- cond = true,
    -- lazy = false,
    -- priority = 1000,
    -- init = function()
    --     vim.cmd('colorscheme dogrun')
    -- end

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
