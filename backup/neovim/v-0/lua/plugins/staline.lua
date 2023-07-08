return {
    'tamton-aquib/staline.nvim',
    lazy = false,
    config = function()
        require('stabline').setup {
            fg = '#84a598',
            inactive_fg = '#aaaaaa',
            stab_right = '',
            stab_left = '',
        }
        require 'staline'.setup {
            sections = {
                left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
                mid = { 'file_name' },
                right = { 'line_column' }
            },
            mode_colors = {
                i = '#d4be98',
                n = '#84a598',
                c = '#8fbf7f',
                v = '#fc802d',
            },
            defaults = {
                true_colors = true,
                line_column = ' [%l/%L] :%c  ',
                branch_symbol = ' ',
            }

        }
    end
}
