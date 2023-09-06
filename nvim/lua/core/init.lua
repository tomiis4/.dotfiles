-- already working
require('core.statusline')
require('core.terminal')
require('core.transparent')
require('core.completion')

-- working on
-- local x = require('core.utils.input')
-- local y = require('core.utils.select')
local y = require('core.custom-plugins.buffer-manager')
vim.keymap.set('n', 'cc', y.toggle, {})
