vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'dstein64/vim-startuptime' -- measure startup time
    use 'wakatime/vim-wakatime' -- count time you have spend in vim

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'xiyaowong/transparent.nvim' -- make background transparent
    use { 'echasnovski/mini.starter', branch = 'stable' }


    use 'brenoprata10/nvim-highlight-colors' -- display colors
    use 'lukas-reineke/indent-blankline.nvim' -- display blankline with line
    use 'nvim-tree/nvim-web-devicons' -- add icons

    use 'tamton-aquib/staline.nvim' -- statusline

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use 'windwp/nvim-autopairs' -- smart autopairs
    use 'lewis6991/gitsigns.nvim' -- git integration (show hunks & new files)
    use 'numToStr/Comment.nvim' -- commenter
    use { 
        'tamago324/lir.nvim', -- filetree
        requires = {
            { 'tamago324/lir-git-status.nvim' } -- show git status in filetree
        }
    } 

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1', -- fzf
        requires = { 
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-symbols.nvim'}
        }
    }

    -- lsp
    use {
        'neovim/nvim-lspconfig',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
	        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        }
    }

    -- completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- Sources
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-calc'},
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
