return {
    {
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
                    left = { '  ', 'mode', ' ', 'file_name', ' ', 'branch' },
                    mid = { 'lsp' },
                    right = { 'lsp_name', 'line_column' }
                },
                mode_colors = {
                    i = "#C4A7E7",
                },
                defaults = {
                    lsp_client_symbol = "",
                    true_colors = true,
                    line_column = ' [%l/%L] :%c  ',
                    branch_symbol = ' ',
                    font_active = "bold"
                }
            }
        end
    },
}
