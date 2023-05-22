return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                dark = "mocha",
            },
            transparent_background = true,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = { "italic" },
                operators = {},
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = false,
                telescope = true,
                notify = false,
                mini = false,
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"


        -- markdown syntax
        vim.cmd [[let g:markdown_fenced_languages = ['ts=typescript', 'js=javascript', 'lua', 'c'] ]]

        -- highlight
        vim.cmd [[:highlight GitSignsAdd guibg=NONE]]
        vim.cmd [[:highlight GitSignsChange guibg=NONE]]
        vim.cmd [[:highlight GitSignsDelete guibg=NONE]]
    end,
}
