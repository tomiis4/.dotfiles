local wezterm = require('wezterm')
local act = wezterm.action
local gruvbox = require('colors.gruvbox')
local cfg = {}

-- clean error messages
if wezterm.config_builder then
    cfg = wezterm.config_builder()
end

-- font
cfg.font = wezterm.font('CaskaydiaMono NFM')
cfg.font_size = 12

-- colors
cfg.colors = gruvbox

local battery_icons = {
    '󰂎', '󰁺', '󰁻',
    '󰁼', '󰁾', '󰁿',
    '󰂀', '󰂁', '󰂂',
    '󰁹', '󰁹'
}
wezterm.on("update-right-status", function(window, _)
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
cfg.tab_max_width = 18
cfg.window_decorations = "RESIZE"
cfg.hide_tab_bar_if_only_one_tab = true
cfg.tab_bar_at_bottom = true
cfg.use_fancy_tab_bar = false
cfg.check_for_updates = false
cfg.initial_rows = 20
cfg.initial_cols = 100
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
        key = 'n',
        mods = 'CTRL',
        action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    },
    {
        key = 'm',
        mods = 'CTRL',
        action = act.PasteFrom 'PrimarySelection'
    },
    {
        key = 'f',
        mods = 'LEADER',
        action = wezterm.action.ShowTabNavigator
    },
}


return cfg
