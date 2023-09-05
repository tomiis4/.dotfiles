-- already working
require('core.statusline')
require('core.terminal')
require('core.transparent')
require('core.completion')

-- working on
local x = require('core.utils.input')
x.input({
    title = 'x',
    position = 'center',
    border = 'rounded',
    size = {
        height = 0.5,
        width = 0.5,
    },
    content = {},
    }, function (option, _)
        vim.print(option)
    end)
