-- TODO: add sources
-- TODO: fix window movment "follow" cursor
-- TODO: fix toggle window when know how to complete, and delete completed

---@class Size
---@field width number
---@field height number

local M = {}
local api = vim.api
local floor = math.floor
local ns = api.nvim_create_namespace('Completion')

local config = {
    window = {
        border = 'rounded',
        winblend = 0,
        keys = {
            confirm = '<cr>',
            close_menu = '<c-e>',
            next_item = '<tab>',
            prev_item = '<s-tab>',
        }
    }
}

local active_windows = {} ---@type table<table<number, number>> win, buf
local is_enabled = false


---@param key string
---@param action function|string
---@param buf number?
---@param mode string?
M.keyset = function(key, action, buf, mode)
    local opts = buf and { buffer = buf } or {}
    mode = mode or 'n'

    vim.keymap.set(mode, key, action, opts)
end

M.clear_menu = function()
    for _, v in pairs(active_windows) do
        local win, buf = v[1], v[2]

        if win ~= nil and api.nvim_win_is_valid(win) then
            api.nvim_win_close(win, true)
        end

        if buf ~= nil and api.nvim_buf_is_valid(buf) then
            api.nvim_buf_delete(buf, { force = true })
        end
    end

    active_windows = {}
end

---@param size Size
---@param content table<string>
---@param callback fun(opt: string, nth_opt: number)
M.create_menu = function(size, content, callback)
    local keys = config.window.keys
    local cursor = 1
    local buf = api.nvim_create_buf(false, true)

    api.nvim_buf_set_lines(buf, 0, -1, true, content)

    local win_opts = {
        relative = 'cursor',
        width = size.width,
        height = size.height,
        row = 1,
        col = -2,
        style = 'minimal',
        border = config.window.border,
    }

    local win = api.nvim_open_win(buf, false, win_opts)

    -- configure window
    api.nvim_win_set_option(win, 'winblend', config.window.winblend)
    api.nvim_set_option_value('modifiable', false, { buf = buf })
    api.nvim_set_option_value('buflisted', false, { buf = buf })
    api.nvim_set_option_value('cursorline', true, { buf = buf })

    -- TODO: add to config
    -- api.nvim_set_option_value('winhighlight', 'Normal:Normal,FloatBorder:Normal', { win = win })

    table.insert(active_windows, { win, buf })

    local function select_item()
        local row = api.nvim_win_get_cursor(win)[1]
        local selected_item = content[row]

        callback(selected_item, row)
    end

    ---@param direction 'prev'|'next'
    local function change_selection(direction)
        if direction == 'prev' then
            cursor = cursor - 1
        else
            cursor = cursor + 1
        end

        -- fix cursor out of window
        if cursor <= 0 then
            cursor = #content
        elseif cursor > #content then
            cursor = 1
        end

        api.nvim_win_set_cursor(win, { cursor, 0 })
    end

    M.keyset(keys.confirm, function() select_item() end, nil, 'i')
    M.keyset(keys.close_menu, function() M.toggle() end, nil, 'i')
    M.keyset(keys.next_item, function() change_selection('next') end, nil, 'i')
    M.keyset(keys.prev_item, function() change_selection('prev') end, nil, 'i')
end

---@param content table<string>
---@return table<string>
M.filter_content = function(content)
    ---@param col number
    ---@param line string
    ---@return string
    local function get_word(col, line)
        local idx = 0

        -- FIXME: work only when you are on start of line
        for v in line:gmatch('%S+') do
            if col <= idx + #v then
                return v
            end

            idx = idx + #v + 1
        end

        return ''
    end

    local row, col = unpack(api.nvim_win_get_cursor(0))
    local line = unpack(api.nvim_buf_get_lines(0, row - 1, row, false))
    local enter_value = get_word(col, line)
    print(enter_value)

    return vim.tbl_filter(function(select_value)
            return select_value:find(enter_value) ~= nil
        end, content)
end

M.display_menu = function()
    if not is_enabled then
        M.clear_menu()
        return
    end

    local content = M.filter_content({ 'height', 'fun', 'lgtm', 'y', 'local', 'test' })

    if #content <= 0 then return end

    M.create_menu(
        { width = 55, height = #content },
        content,
        function(opt, _)
            is_enabled = false

            local row, col = unpack(api.nvim_win_get_cursor(0))
            local line = unpack(api.nvim_buf_get_lines(0, row - 1, row, false))
            local updated_line = line:sub(1, col) .. opt .. line:sub(col + 1)

            api.nvim_buf_set_lines(0, row - 1, row, false, { updated_line })
            api.nvim_win_set_cursor(0, { row, col + #opt })

            is_enabled = true
            M.redraw()
        end)
end

M.redraw = function()
    M.clear_menu()
    M.display_menu()
end

M.toggle = function()
    is_enabled = not is_enabled
    M.clear_menu()
    M.display_menu()
end

api.nvim_create_user_command('Complete', M.toggle, {})
api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        is_enabled = false
        M.clear_menu()
    end
})
api.nvim_create_autocmd({ 'VimResized', 'CursorMovedI' }, {
    callback = function()
        M.redraw()
    end
})

return M
