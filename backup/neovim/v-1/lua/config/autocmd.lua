local api = vim.api

api.nvim_create_autocmd('BufEnter', {
    callback = function()
        local f = vim.bo.filetype
        local is_valid = f == 'markdown' or f == 'text' or f == ''

        if is_valid then
            vim.opt.colorcolumn = {0}
        else
            vim.opt.colorcolumn = {80}
        end
    end
})
