local function hint_words()
    local hop = require('hop')
    hop.hint_words()
end

local function hint_char()
    local hop = require('hop')
    hop.hint_char1()
end

local function hint_patterns()
    local hop = require('hop')
    hop.hint_patterns()
end

return {
    'phaazon/hop.nvim',
    branch = 'v2',
    keys = {
        { 'f', hint_words },
        { 'F', hint_char },
        { '<Tab>f', hint_patterns },
    },
    config = function()
        require('hop').setup {
            keys = 'etovxqpdygfblzhckisuran'
        }
    end
}
