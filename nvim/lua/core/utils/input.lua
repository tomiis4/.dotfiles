local U = require('core.utils.util')
local M = {}
local api = vim.api

---@param args WinBufArg
---@param callback fun(option: string, n_option: number)
M.input = function(args, callback)
    args.content = {}
    args.size.height = math.floor(100 / vim.o.lines)
end

--[[
100% ... 37l
  x% ... 1

x = 100 / 371
--]]

return M
