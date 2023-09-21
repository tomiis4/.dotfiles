local api = vim.api
local M = {}

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
;

return M
