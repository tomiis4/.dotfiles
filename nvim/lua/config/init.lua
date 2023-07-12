require('config.keymap')
require('config.set')


vim.api.nvim_create_user_command(
    'Presence',
    ':lua print("Starting Presence")',
    {}
)

require('config.lazy')
