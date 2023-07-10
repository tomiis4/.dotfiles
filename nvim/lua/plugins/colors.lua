---@param hl string
---@param type 'foreground'|'background'
local function get_hl(hl, type)
    local high = vim.api.nvim_get_hl_by_name(hl, true)[type]
    return high
    -- return high and ("#%06x"):format(high) or nil
end

return {
    'mcchrish/zenbones.nvim',
    dependencies = {
        'rktjmp/lush.nvim'
    },
    lazy = false,
    priority = 1000,
    init = function()
        local hl = vim.api.nvim_set_hl

        vim.cmd('colorscheme rosebones')

        local hl_bg = get_hl('FloatBorder', 'foreground')
        -- remove background
        hl(0, "Normal", { bg = "none" })
        hl(0, "NormalFloat", { bg = "none" })

        -- change colors
        hl(0, "ColorColumn", { bg = '#282c34' })
        hl(0, "CursorLine", { bg = '#282c34' })

        -- TODO: make it same as border color
        -- change statusline
        hl(0, 'StatusLine', { bg = hl_bg, fg = "#282c34" })
        hl(0, 'StatusLineNC', { bg = hl_bg, fg = "#5c6370" })
    end
}
