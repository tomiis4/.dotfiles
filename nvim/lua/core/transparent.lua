local api = vim.api
vim.g.is_transparent = true

---@param hl string
---@param type 'foreground'|'background'
local function get_hl(hl, type)
    return api.nvim_get_hl_by_name(hl, true)[type]
end

api.nvim_create_user_command(
    'Transparent',
    function()
        local color = vim.g.colors_name

        vim.g.is_transparent = not vim.g.is_transparent
        vim.cmd('colorscheme ' .. color)
    end, {}
)

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        if vim.g.is_transparent then
            local hl = vim.api.nvim_set_hl
            local fg_border = get_hl('FloatBorder', 'foreground')
            local bg_none = { bg = 'none' }

            -- remove background
            hl(0, 'Normal', bg_none)
            hl(0, 'NormalNC', bg_none)
            hl(0, 'NormalFloat', bg_none)
            hl(0, 'FloatBorder', bg_none)
            hl(0, 'Error', bg_none)

            -- change colors
            hl(0, 'ColorColumn', { bg = '#282c34' })
            hl(0, 'CursorLine', { bg = '#282c34' })

            -- change statusline
            hl(0, 'StatusLine', { bg = fg_border, fg = '#282c34' })
            hl(0, 'StatusLineNC', { bg = fg_border, fg = '#5c6370' })
        end
    end
})
