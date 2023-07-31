return {
    {
        'mcchrish/zenbones.nvim',
        cond = false,
        dependencies = {
            'rktjmp/lush.nvim'
        },
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd('colorscheme rosebones')
        end
    },
    {
        'wadackel/vim-dogrun',
        cond = true,
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd('colorscheme dogrun')
        end
    },
    {
        'mathofprimes/nightvision-nvim',
        cond = false,
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd('colorscheme nightvision')
        end
    }
}
