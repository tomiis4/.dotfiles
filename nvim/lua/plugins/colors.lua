local colors = {
    ['rosebones'] = {
        name = 'rosebones',
        description = 'low contrast rose-pine, purple/blue',
        link = 'mcchrish/zenbones.nvim',
        dependencies = {'rktjmp/lush.nvim'}
    },
    ['dogrun'] = {
        description = 'modified rose-pine',
        name = 'dogrun',
        link = 'wadackel/vim-dogrun',
    },
    ['melange'] = {
        name = 'melange',
        description = 'warm orange theme',
        link = 'savq/melange-nvim',
    },
    ['nightvision'] = {
        name = 'nightvision',
        description = 'fully green',
        link = 'mathofprimes/nightvision-nvim',
    },
    ['komau'] = {
        name = 'candle-grey-transparent',
        description = 'very low contrast colorscheme',
        link = 'aditya-azad/candle-grey',
    },
    ['custom'] = {
        name = 'ethereal',
        link = 'wadackel/vim-dogrun' -- only way to work
    }
}

local scheme = colors['custom']

return {
    scheme.link,
    dependencies = scheme.dependencies or {},
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd('colorscheme ' .. scheme.name)
    end
}
