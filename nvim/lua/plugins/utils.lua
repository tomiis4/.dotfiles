-- terminal
vim.keymap.set('n', '<leader>t', ':terminal <CR>', {})

-- exit insert move in terminal
vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]


return {
	{
		'wakatime/vim-wakatime',
		lazy = true,
		event = "InsertEnter",
        priority = 1,

	},
}
