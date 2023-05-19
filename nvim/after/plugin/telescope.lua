local builtin = require('telescope.builtin')

require('telescope').setup {
	defaults = {
		file_ignore_patterns = { "node_modules", ".git" }
	},
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	}
}

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
