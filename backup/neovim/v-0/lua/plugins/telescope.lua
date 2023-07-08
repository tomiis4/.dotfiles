return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    priority = 10,
    keys = { "f", '<cmd>Telescope find_files<CR>', desc = "" },
    config = function()
        local builtin = require('telescope.builtin')

        require('telescope').setup {
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.9,
                    preview_cutoff = 120,
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true
                },
            },
        }

        vim.keymap.set('n', 'ff', builtin.find_files, {})
        vim.keymap.set('n', 'fg', builtin.live_grep, {})
    end
}
