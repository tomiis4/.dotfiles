return {
    'mcchrish/zenbones.nvim',
    dependencies = {
        'rktjmp/lush.nvim'
    },
    lazy = false,
    priority = 1000,
    init = function()
        local hl = vim.api.nvim_set_hl
        vim.cmd('colorscheme zenbones')

        -- remove background
        hl(0, "Normal", { bg = "none" })
        hl(0, "NormalFloat", { bg = "none" })

        -- change colors
        hl(0, "ColorColumn", { bg = '#282c34' })
        hl(0, "CursorLine", { bg = '#282c34' })

        -- change statusline
        hl(0, 'StatusLine', { bg = "#282c34", fg = "#abb2bf" })
        hl(0, 'StatusLineNC', { bg = "#282c34", fg = "#5c6370" })
    end
}
