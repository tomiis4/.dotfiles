local kind_tbl = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

local function get_hl(hl, type)
    local high = vim.api.nvim_get_hl_by_name(hl, true)[type]
    return high
end

local function add_hl()
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

    vim.api.nvim_set_hl(0, 'CmpN', { bg = get_hl('CursorLine', 'background') })
    vim.api.nvim_set_hl(0, 'CmpL', { bg = get_hl('Visual', 'background') })
end

return {
    'hrsh7th/nvim-cmp',
    event = {
        'InsertEnter', 'CmdlineEnter'
    },
    dependencies = {
        -- cmp sources
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        -- lsp
        'hrsh7th/cmp-nvim-lsp-signature-help',

        -- Snippets
        'dcampos/cmp-snippy',
        'dcampos/nvim-snippy',
    },
    config = function()
        local is_transparent = vim.g.is_transparent or false
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        add_hl()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('snippy').expand_snippet(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            window = {
                completion = {
                    border = 'none',
                    col_offset = -3,
                    side_padding = 0,
                    winhighlight = 'Normal:Visual,FloatBorder:Visual,CursorLine:Search,Search:None'
                },
                documentation = {
                    border = 'none',
                    winhighlight = 'FloatBorder:NormalFloat,Normal:Visual'
                }
            },
            sources = cmp.config.sources({
                { name = 'snippy',                  priority = 1000 },
                { name = 'nvim_lsp_signature_help', priority = 900 },
                { name = 'nvim_lua',                priority = 950 },
                { name = 'path',                    priority = 900 },
                { name = 'nvim_lsp',                priority = 400 },
                { name = 'buffer',                  priority = 400 },
            }),
            experimental = {
                ghost_text = {
                    hl_group = 'Comment',
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local source = entry.source.name
                    local kind = vim_item.kind

                    vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            snippy = "[Snippy]",
                            nvim_lua = "[Lua]",
                        })[source]

                    vim_item.kind = ' ' .. kind_tbl[kind] .. ' '
                    return vim_item
                end
            }
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })

        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('lspconfig.ui.windows').default_options.border = 'rounded'
        require('lspconfig')['gopls'].setup { capabilities = capabilities }
        require('lspconfig')['tsserver'].setup { capabilities = capabilities }
        require 'lspconfig'.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        }

        vim.diagnostic.config({
            virtual_text = { prefix = '' },
            update_in_insert = false,
            signs = true,
            underline = true,
            severity_sort = true,
            float = { border = 'rounded' },
        })

        local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- keymaps for format/open diagnostic
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { silent = true })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true })
    end,
}
