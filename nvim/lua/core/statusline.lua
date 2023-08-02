local icons = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

local function diagnostic_LSP()
    local s = ''

    local error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    local hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

    for k, v in pairs({ Error = error, Warn = warn, Info = info, Hint = hint }) do
        if v > 0 then
            local data = string.format('%s%s', icons[k], v)

            s = string.format('%s%s ', s, data)
        end
    end

    return s
end

local filename = "  %{expand('%:p:~:.:h')}/%{expand('%:t')}"
local isSaved = ' %m'
local split = '%='
local lsp = ''
local lines = '[%l/%L]  '

vim.api.nvim_create_autocmd('DiagnosticChanged', {
    callback = function()
        lsp = diagnostic_LSP()
        vim.o.statusline = string.format('%s%s%s%s%s%s', filename, isSaved, split, lsp, split, lines)
    end
})

vim.o.statusline = string.format('%s%s%s%s%s%s', filename, isSaved, split, lsp, split, lines)
