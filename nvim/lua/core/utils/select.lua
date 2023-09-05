local U = require('core.utils.util')
local M = {}
local api = vim.api

---@param args WinBufArg
---@param callback fun(option: string, n_option: number)
---@return number, number
M.select = function(args, callback)
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
    local function select_element()
        local row = api.nvim_win_get_cursor(0)[1]
        callback(args.content[row], row)
    end

    -- configure buffer and window
    local buf, win = U.setup_buf_win(args)
    api.nvim_set_option_value('cursorline', true, { buf = buf })

    -- autocmd for resizing
    api.nvim_create_autocmd('VimResized', {
        buffer = buf,
        callback = function()
            clear(buf, win)
            M.select(args, callback)
        end
    })

    -- autocmd for setting win
    -- FIXME ^
    api.nvim_create_autocmd('WinEnter', {
        callback = function()
            if api.nvim_get_current_win() == win then
                api.nvim_set_current_win(win)
                print("x")
            end
        end
    })

    U.keyset(buf, '<cr>', function()
        select_element()
        clear(buf, win)
    end)

    return buf, win
end

return M
