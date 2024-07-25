return {
    'nat-418/boole.nvim',
    key = '<C-b>',
    keys = {
        { '<C-b>', ':Boole increment' },
        { '<C-B>', ':Boole decrement' },
    },
    config = function()
        require('boole').setup({
            mappings = {
                increment = '<C-b>',
                decrement = '<C-B>'
            },
        })
    end
}
