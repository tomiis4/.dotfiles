local wezterm = require('wezterm')
local act = wezterm.action
local theme = require('lua/rose-pine')
local cfg = {}

-- C-S-t: new window

local colors = theme.colors()
local window_frame = theme.window_frame()

-- clean error message
if wezterm.config_builder then
    cfg = wezterm.config_builder()
end

-- font
cfg.font = wezterm.font('JetBrainsMono NF')
cfg.font_size = 14

-- colors
cfg.window_background_image = wezterm.home_dir .. '\\.config\\wallpapers\\mountain-1-rose-pine.png'
cfg.colors = colors
cfg.window_frame = window_frame

-- display
cfg.use_fancy_tab_bar = false
cfg.window_padding = {
    left = 8,
    right = 8, -- also the width of the scroll bar
    top = 5,
    bottom = 5,
}

-- shell
cfg.default_prog = { 'nu' }

-- keymaps
cfg.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
cfg.keys = {
    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 't',
        mods = 'CTRL',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'w',
        mods = 'CTRL',
        action = act.CloseCurrentPane{ confirm = true },
    },
}



return cfg
