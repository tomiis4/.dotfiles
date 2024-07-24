local U = require('core.utils.util')
local M = {}
local api = vim.api

---@param args WinBufArg
---@param callback fun(option: string, n_option: number)
M.input = function(args, callback)
    ---@param buf number
    ---@param win number
    local function clear(buf, win)
        if win ~= nil and api.nvim_win_is_valid(win) then
            api.nvim_win_close(win, true)
        end

        if buf ~= nil and api.nvim_buf_is_valid(buf) then
            api.nvim_buf_delete(buf, { force = true })
        end
    end

    args.content = {}
    args.size.height = 1 / vim.o.lines

    local buf, win = U.setup_buf_win(args)

    -- configure win and register it to `input_screens`
    api.nvim_set_option_value('modifiable', true, { buf = buf })
    api.nvim_set_option_value('number', false, { buf = buf })
    api.nvim_set_current_win(win)
    api.nvim_win_set_cursor(win, {1, 0}) -- TODO: add second len of content

    -- insert & confirm
    vim.cmd('startinsert')

    U.keyset(buf, '<cr>', function()
        vim.cmd('stopinsert')

        local value = api.nvim_buf_get_lines(0, 0, 1, false)[1]
        callback(value, -1)
        clear(buf, win)
    end, 'i')

end

--[[
100% ... 37l
  x% ... 1

x = 100 / 371
--]]

return M
