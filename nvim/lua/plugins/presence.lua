return {
    'andweeb/presence.nvim',
    lazy = false,
    config = function()
        require("presence").setup({
            enable_line_number  = true,
            buttons = {
                { label = 'Github', url = 'https://github.com/tomiis4'},
            }
        })
    end
}
