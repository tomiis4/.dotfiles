local api = vim.api
vim.g.is_transparent = false

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
            local bg_none = { bg = 'none' }
            local remove_bg_group = {
                'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder',
                'Terminal', 'Error', 'DiffAdd', 'DiffChange', 'DiffDelete',
                'DiffText', 'Directoryy', 'EndOfBuffer', 'ErrorMsg'
            }

            -- remove background
            for _, v in pairs(remove_bg_group) do
                hl(0, v, bg_none)
            end
        end
    end
})
