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
        'onsails/lspkind.nvim',

        -- Snippets
        'dcampos/cmp-snippy',
        'dcampos/nvim-snippy',
    },
    config = function()
        local function get_hl(hl, type)
            local high = vim.api.nvim_get_hl_by_name(hl, true)[type]
            return high
        end

        local lspkind = require('lspkind')
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        vim.api.nvim_set_hl(0, 'CmpN', { bg = get_hl('CursorLine', 'background') })
        vim.api.nvim_set_hl(0, 'CmpL', { bg = get_hl('Visual', 'background') })

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
                    winhighlight = "Normal:CmpN,CursorLine:CmpL"
                },
                documentation = {
                    border = 'none',
                    winhighlight = "Normal:CmpN,CursorLine:CmpL"
                }
            },
            sources = cmp.config.sources({
                { name = 'snippy' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            }),
            experimental = {
                ghost_text = {
                    hl_group = 'Comment',
                },
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text', -- show only symbol annotations
                    maxwidth = 50,
                    ellipsis_char = '...',

                    before = function(_, vim_item)
                        return vim_item
                    end
                })
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
