---@param key string
---@param action string
---@param opts table?
local function keyset(mode, key, action, opts)
    opts = opts or {
        silent = true
    }

    vim.keymap.set(mode, key, action, opts)
end


vim.g.mapleader = ' '

-- disable arrows
vim.cmd([[
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>

    inoremap <Up> <Nop>
    inoremap <Down> <Nop>
    inoremap <Left> <Nop>
    inoremap <Right> <Nop>
]])

-- move window by HLKJ
keyset('n', '<leader>h', ':wincmd h <CR>')
keyset('n', '<leader>l', ':wincmd l <CR>')
keyset('n', '<leader>k', ':wincmd k <CR>')
keyset('n', '<leader>j', ':wincmd j <CR>')

-- clear search pattern
keyset('n', 'mm', ':nohlsearch <CR>')

-- replace word (best keybinding ever)
keyset('n', '<cr>', 'ciw')

-- disable q: (command line history)
keyset('n', 'q:', ':q', { silent = false })

-- open terminal
keyset('n', '<leader>t', ':term <cr>')

-- center screen next/prev occurrence search
keyset('n', 'n', 'nzzzv')
keyset('n', 'N', 'Nzzzv')

-- cycle trough buffers
keyset('n', '<C-j>', ':bp <CR>')
keyset('n', '<C-k>', ':bn <CR>')

-- force-delete buffer
keyset('n', '<C-x>', ':bd! <CR>')

-- copy to system register
keyset('v', '<leader>y','"+y')
keyset('v', '<leader>p','"+p')
