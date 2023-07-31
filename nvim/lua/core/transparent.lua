local api = vim.api
local ns = api.nvim_create_namespace('Transparent')

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
    group = ns,
    callback = function()
        if vim.g.is_transparent then
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
    end
})
