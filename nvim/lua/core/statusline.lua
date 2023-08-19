local fileName = "  %{fnamemodify(expand('%'), ':~:.')}"
local fileType = " %r%m%y"
local separator = "%="
local curLine = "[%l"
local maxLine = "/%L]"
local column = " %4v  "

vim.o.statusline = fileName .. fileType .. separator .. curLine .. maxLine .. column
