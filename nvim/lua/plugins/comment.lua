return {
    'numToStr/Comment.nvim',
    keys = {
        { "<leader><leader>", "<cmd>lua require('Comment').setup()<cr>", desc = "" },
        { "gcc",              "<cmd>lua require('Comment').setup()<cr>", desc = "" },
    },
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<leader><leader>',
                block = 'gcc',
            },
        })
    end
}
