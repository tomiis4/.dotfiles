local M = {}
local api = vim.api

---@class Active
---@field[0]  number
---@field[1] number

---@class Size
---@field width number
---@field height number

---@alias Position 'left'|'right'|'center'

---@param position Position
---@param size Size
---@return table
M.get_win_pos = function(position, size)
    local height = vim.o.lines
    local width = vim.o.columns
    local floor = math.floor

    if position == 'left' then
        return {
            width = floor(width * size.width),
            height = floor(height * size.height),
            row = floor(height * ((1 - size.height) / 4)),
            col = floor(width / 2 - size.width * width)
        }
    end

    if position == 'right' then
        return {
            width = floor(width * size.width),
            height = floor(height * size.height),
            row = floor(height * ((1 - size.height) / 4)),
            col = floor(width / 2 - size.width * width + width * size.width + 3)
        }
    end

    -- center is default
    return {
        width = floor(width * size.width),
        height = floor(height * size.height),
        row = floor((height - (height * 0.5)) / 2) - 1,
        col = floor(width / 2 - size.width * width / 2)
    }
end

---@class WinBufArg
---@field title string
---@field position Position
---@field size Size
---@field content string[]
local WinBufArg = {
    title = '',
    position = 'center',
    border = 'rounded',
    size = {
        height = 0.5,
        width = 0.5,
    },
    content = {},
}

---@param args WinBufArg
---@return number, number
M.setup_buf_win = function(args)
    ---@param buf_win Active
    local function clear(buf_win)
        local buf, win = buf_win[1], buf_win[2]

        if win ~= nil and api.nvim_win_is_valid(win) then
            api.nvim_win_close(win, true)
        end

        if buf ~= nil and api.nvim_buf_is_valid(buf) then
            api.nvim_buf_delete(buf, { force = true })
        end
    end

    WinBufArg = vim.tbl_deep_extend('force', WinBufArg, args)

    local buf_win = {0,0} ---@type Active

    -- setup buffer
    buf_win[1] = api.nvim_create_buf(false, true)
    api.nvim_buf_set_lines(buf_win[1], 0, -1, true, WinBufArg.content)

    -- setup window
    local win_pos = M.get_win_pos(WinBufArg.position, WinBufArg.size)
    local win_opts = {
        relative = 'editor',
        width = win_pos.width,
        height = win_pos.height,
        row = win_pos.row,
        col = win_pos.col,
        title = string.format(' %s ', WinBufArg.title),
        title_pos = 'center',
        style = 'minimal',
        border = WinBufArg.border,
    }

    buf_win[2] = api.nvim_open_win(buf_win[1], false, win_opts)

    -- configure window
    api.nvim_set_option_value('modifiable', false, { buf = buf_win[1] })
    api.nvim_set_option_value('buflisted', false, { buf = buf_win[1] })

    -- add highlights
    api.nvim_set_option_value('winhighlight', 'Normal:Normal,FloatBorder:Normal', { win = buf_win[2] })

    -- add keymap for quit
    M.keyset(buf_win[1], 'q', function()
        clear(buf_win)
    end)

    -- if you select different window that float
    api.nvim_create_autocmd('WinEnter', {
        buffer = buf_win[1],
        callback = function()
            local selected_win = api.nvim_get_current_win()

            if selected_win ~= buf_win[2] then
                clear(buf_win)
            end
        end
    })

    return buf_win[1], buf_win[2]
end


---@param buf number|nil
---@param key string
---@param action string|function
---@param mode string? default 'n'
---@param opts table?
M.keyset = function(buf, key, action, mode, opts)
    opts = opts or { nowait = true, silent = true }
    opts['buffer'] = buf

    mode = mode or 'n'

    vim.keymap.set(mode, key, action, opts)
end


---@return table<number>
M.get_buffers = function()
    local buffers = api.nvim_list_bufs()
    buffers = vim.tbl_filter(function(buf)
        local is_loaded = api.nvim_buf_is_loaded(buf)
        local is_listed = vim.fn.buflisted(buf) == 1

        if not (is_loaded and is_listed) then
            return false
        end

        return true
    end, buffers)

    return buffers
end


---@param buf number
---@return string
M.get_buffer_name = function(buf)
    return api.nvim_buf_get_name(buf):match("[^\\/]+$") or ""
end


---@param tbl table
---@param val string
---@return number
M.index_of = function(tbl, val)
    for k, v in pairs(tbl) do
        if v == val then
            return k
        end
    end

    return -1
end


return M
