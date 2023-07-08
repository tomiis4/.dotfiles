return {
    "Pocco81/true-zen.nvim",
    keys = {
        { '<leader>ff', ':TZAtaraxis <CR>' }
    },
    config = function()
        require("true-zen").setup()
    end,
}
