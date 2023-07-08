local filename = " %{expand('%:p:~:.:h')}/%{expand('%:t')}"
local isSaved = ' %m'
local split = '%='
local lines = '[%l/%L] '

vim.o.statusline = filename .. isSaved .. split .. lines
