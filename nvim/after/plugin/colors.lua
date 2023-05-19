require('rose-pine').setup({
	variant = 'auto',
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
        base = 'NONE',
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'NONE', blend = 0 },
		StatusLine = { fg = 'NONE', bg = 'NONE', blend = 0 },
	}
})

-- set colorscheme
vim.cmd('colorscheme rose-pine')

-- markdown syntax
vim.cmd [[let g:markdown_fenced_languages = ['ts=typescript', 'js=javascript', 'lua', 'c'] ]]

-- highlight
vim.cmd [[:highlight GitSignsAdd guibg=NONE]]
vim.cmd [[:highlight GitSignsChange guibg=NONE]]
vim.cmd [[:highlight GitSignsDelete guibg=NONE]]
