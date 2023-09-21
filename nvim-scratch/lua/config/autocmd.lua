local U = require('plugins.util.util')
local api = vim.api

-- buffer switcher
local events = {'BufNew', 'BufDelete'}
api.nvim_create_autocmd(events, {
    callback = function(e)
        local buffers = api.nvim_list_bufs()
        buffers = vim.tbl_filter(function(buf)
            local is_loaded = api.nvim_buf_is_loaded(buf)
            local is_listed = vim.fn.buflisted(buf) == 1
            local del_buf = e.event == 'BufDelete' and e.buf or -1

            if not (is_loaded and is_listed) and del_buf ~= buf then
                return false
            end

            return true
        end, buffers)

        for k, v in pairs(buffers) do
            U.keyset(0, '<leader>'..k, function()
                vim.api.nvim_win_set_buf(0, v)
            end)
        end
    end
})
