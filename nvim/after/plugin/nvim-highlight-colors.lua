vim.cmd [[ set t_Co=256 ]]
require('nvim-highlight-colors').setup {
    render = 'foreground',
}
require('nvim-highlight-colors').turnOn()
