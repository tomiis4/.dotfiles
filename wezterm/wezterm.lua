local wezterm = require('wezterm')
local act = wezterm.action
local theme = require('lua/rose-pine')
local cfg = {}

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

local battery_icons = { '󰂎', '󰁺', '󰁻', '󰁼', '󰁾', '󰁿', '󰂀', '󰂁', '󰂂', '󰁹', '󰁹' }
wezterm.on("update-right-status", function(window, pane)
    -- Day Month DD Hour:Minute
    local date = wezterm.strftime("%a %b %-d %H:%M ");

    local battery_status = ''
    for _, b in ipairs(wezterm.battery_info()) do
        local battery = b.state_of_charge * 100
        local icon = battery_icons[math.floor(battery / 10) + 1]

        battery_status = icon .. string.format(' %.0f%%', battery)
    end

    window:set_right_status(wezterm.format({ {
        Text = battery_status .. '  ' .. date
    } }))
end)


-- display
-- cfg.window_decorations = "NONE"
cfg.hide_tab_bar_if_only_one_tab = false
cfg.tab_bar_at_bottom = true
cfg.use_fancy_tab_bar = false
cfg.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 0,
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
        action = act.CloseCurrentPane { confirm = false },
    },
    {
        key = 'c',
        mods = 'CTRL',
        action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    },
    {
        key = 'v',
        mods = 'CTRL',
        action = act.PasteFrom 'PrimarySelection'
    },
    {
        key = 'f',
        mods = 'LEADER',
        action = wezterm.action.ShowTabNavigator
    }
}


return cfg
