return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    event = "BufEnter",
    config = function()
        require("ibl").setup()
    end
}
