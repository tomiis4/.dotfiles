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
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- luasnip
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-c>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            window = {
                completion = cmp.config.window.bordered({ border = 'rounded' }),
                documentation = cmp.config.window.bordered({ border = 'rounded' }),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'buffer' },
            }),
            experimental = {
                ghost_text = {
                    hl_group = 'Comment',
                },
            },
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

        local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- keymaps for format/open diagnostic
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { silent = true })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true })
    end,
}
