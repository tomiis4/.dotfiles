return {
    'numToStr/Comment.nvim',
    keys = {
        { "gc", "<cmd>lua require('Comment').setup()<cr>", desc = "" },
        { "gcc",              "<cmd>lua require('Comment').setup()<cr>", desc = "" },
    },
    config = function()
        require('Comment').setup({
            toggler = {
                line = 'gc',
                block = 'gcc',
            },
        })
    end
}
