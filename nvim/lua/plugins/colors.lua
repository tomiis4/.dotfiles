---@param hl string
---@param type 'foreground'|'background'
local function get_hl(hl, type)
    local high = vim.api.nvim_get_hl_by_name(hl, true)[type]
    return high
end

-- after colorscheme change, disable bg
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        local hl = vim.api.nvim_set_hl
        local hl_bg = get_hl('FloatBorder', 'foreground')

        -- remove background
        hl(0, "Normal", { bg = "none" })
        hl(0, "NormalNC", { bg = "none" })
        hl(0, "NormalFloat", { bg = "none" })
        hl(0, "FloatBorder", { bg = "none" })

        -- change colors
        hl(0, "ColorColumn", { bg = '#282c34' })
        hl(0, "CursorLine", { bg = '#282c34' })

        -- change statusline
        hl(0, 'StatusLine', { bg = hl_bg, fg = "#282c34" })
        hl(0, 'StatusLineNC', { bg = hl_bg, fg = "#5c6370" })
    end
})

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
