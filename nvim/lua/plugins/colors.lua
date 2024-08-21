return {
    'RRethy/base16-nvim',
    init = function()
        require('base16-colorscheme').with_config({
            telescope = false,
            cmp = false,
        })
        vim.cmd('colorscheme base16-gruvbox-dark-medium')
    end
}
