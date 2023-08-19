local wezterm = require('wezterm')
local act = wezterm.action
local rosepine = require('colors.rose-pine')
local cfg = {}

-- clean error messages
if wezterm.config_builder then
    cfg = wezterm.config_builder()
end

-- font
cfg.font = wezterm.font('Hurmit Nerd Font Mono')
cfg.font_size = 12

-- colors
-- local img_path = wezterm.home_dir .. '\\.config\\wallpapers\\'
-- cfg.window_background_image = img_path .. 'green-gray-0.png'
cfg.colors = rosepine

local battery_icons = {
    '󰂎', '󰁺', '󰁻',
    '󰁼', '󰁾', '󰁿',
    '󰂀', '󰂁', '󰂂',
    '󰁹', '󰁹'
}
wezterm.on("update-right-status", function(window, _)
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
cfg.tab_max_width = 18
cfg.window_decorations = "RESIZE"
cfg.hide_tab_bar_if_only_one_tab = true
cfg.tab_bar_at_bottom = true
cfg.use_fancy_tab_bar = false
cfg.check_for_updates = false
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
    },
}


return cfg
