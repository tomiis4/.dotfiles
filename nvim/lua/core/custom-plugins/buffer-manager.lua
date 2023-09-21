local M = {}
local S = require('core.utils.select')
local U = require('core.utils.util')
local api = vim.api

---@param buf_win Active
local buf_win = { 0, 0 }
local is_enabed = false


M.clear = function()
    local buf, win = buf_win[1], buf_win[2]

    if win ~= nil and api.nvim_win_is_valid(win) then
        api.nvim_win_close(win, true)
    end

    if buf ~= nil and api.nvim_buf_is_valid(buf) then
        api.nvim_buf_delete(buf, { force = true })
    end
end

M.switch_by_numbers = function()
    local ids = U.get_buffers()

    -- switch by numbers
    for k, v in pairs(ids) do
        U.keyset(nil, '<leader>' .. k, function()
            M.clear()
            api.nvim_win_set_buf(0, v)
        end)
    end

    -- FIXME: bufdelete
    api.nvim_create_autocmd('BufAdd', {
        callback = function()
            M.switch_by_numbers()
        end
    })
end

-- FIXME: if exit by 'q' change to false
M.toggle = function()
    is_enabed = not is_enabed

    -- get buffer info
    local buf_ids = U.get_buffers()
    local buf_names = vim.tbl_map(function(buf)
        return U.get_buffer_name(buf)
    end, buf_ids)

    -- todo, switch with numbers only in menu
    M.switch_by_numbers()

    -- check if is enabled
    if not is_enabed then
        M.clear()
        return
    end

    -- setup args
    local args = {
        title = 'Buffers',
        position = 'center',
        border = 'rounded',
        size = {
            height = 0.5,
            width = 0.5,
        },
        content = buf_names,
    }

    -- setup windows and buffer
    local buf, win = S.select(args, function (option, _)
        local n = U.index_of(buf_names, option)
        local id = buf_ids[n]

        is_enabed = false
        M.clear()
        api.nvim_win_set_buf(0, id)
    end)

    -- swtich by numbers only
    for k, v in pairs(buf_ids) do
        U.keyset(buf, ''..k, function()
            M.clear()
            api.nvim_win_set_buf(0, v)
        end)
    end

    api.nvim_set_current_win(win)
    api.nvim_set_option_value('number', true, {buf = buf})
    buf_win = {buf, win}
end



return M
