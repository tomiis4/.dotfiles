return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    keys = {
        { '<leader>ff', ':Telescope find_files<cr>', desc = '' },
        { '<leader>fg', ':Telescope live_grep<cr>', desc = '' },
        { '<leader>fh', ':Telescope help_tags<cr>', desc = '' },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('telescope').setup {
            defaults = {
                preview = false,
                file_ignore_patterns = { 'node_modules', '.git' },
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        preview_width = 0.4,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.70,
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
    end
}
