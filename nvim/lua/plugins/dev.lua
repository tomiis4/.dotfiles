return {
    dir = '~\\Workspace\\Lua\\BufferTabs.nvim',
    enabled = false,
    config = function()
        require('buffertabs').setup({
            ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
            border = 'rounded',

            ---@type integer
            padding = 1,

            ---@type boolean
            icons = true,

            ---@type string use hl Group or hex color
            hl_group = 'Keyword',

            ---@type string use hl Group or hex color
            hl_group_inactive = 'Comment',

            modified = "[+]",

            ---@type table[]
            exclude = {},

            ---@type boolean
            show_all = false,

            ---@type boolean
            show_single_buffer = false,

            ---@type 'row'|'column'
            display = 'column',

            ---@type 'left'|'right'|'center'
            horizontal = 'right',

            ---@type 'top'|'bottom'|'center'
            vertical = 'top',

            ---@type number in ms (recommend 2000)
            timeout = 2000
        })
    end
}
