-- colorscheme
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

local wezterm = require 'wezterm'

return {
    -- shell
    default_prog = { 'C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' },
    -- font
    font = wezterm.font('JetBrainsMono Nerd Font'),
    font_size = 13.0,
    -- colorscheme
    colors = colors,
    window_frame = window_frame,
    background = {
        {
            source = { File = "C:/wallpapers/tokyo.png" },
        },
        {
            source = { Color = "#191724" },
            height = "100%",
            width = "100%",
            opacity = 0.70,
        },
    },
}
