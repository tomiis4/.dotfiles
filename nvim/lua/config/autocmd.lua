local api = vim.api

api.nvim_create_autocmd('BufEnter', {
    callback = function()
        local f = vim.bo.filetype

        if f == 'markdown' then
            vim.opt.colorcolumn = {0}
        else
            vim.opt.colorcolumn = {80}
        end
    end
})
