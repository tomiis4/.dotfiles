-- scheme: "Gruvbox dark, medium"
-- author: "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)"
-- base00: "#282828" # ----
-- base01: "#3c3836" # ---
-- base02: "#504945" # --
-- base03: "#665c54" # -
-- base04: "#bdae93" # +
-- base05: "#d5c4a1" # ++
-- base06: "#ebdbb2" # +++
-- base07: "#fbf1c7" # ++++
-- base08: "#fb4934" # red
-- base09: "#fe8019" # orange
-- base0A: "#fabd2f" # yellow
-- base0B: "#b8bb26" # green
-- base0C: "#8ec07c" # aqua/cyan
-- base0D: "#83a598" # blue
-- base0E: "#d3869b" # purple
-- base0F: "#d65d0e" # brown

local palette = {
    base = '#282828',
    overlay = '#3c3836',
    muted = '#504945',
    text = '#fbf1c7',
    love = '#fb4934',
    gold = '#fe8019',
    rose = '#d3869b',
    pine = '#8ec07c',
    foam = '#83a598',

    iris = '#fabd2f',
    highlight_high = '#665c54',
}

local active_tab = {
    bg_color = palette.overlay,
    fg_color = palette.text,
}

local inactive_tab = {
    bg_color = palette.base,
    fg_color = palette.muted,
}

local color = {
    foreground = palette.text,
    background = palette.base,
    cursor_bg = palette.highlight_high,
    cursor_border = palette.highlight_high,
    cursor_fg = palette.text,
    selection_bg = palette.highlight_high,
    selection_fg = palette.text,
    ansi = {
        palette.overlay,
        palette.love,
        palette.pine,
        palette.gold,
        palette.foam,
        palette.iris,
        palette.rose,
        palette.text,
    },
    brights = {
        palette.muted,
        palette.love,
        palette.pine,
        palette.gold,
        palette.foam,
        palette.iris,
        palette.rose,
        palette.text,
    },
    tab_bar = {
        background = palette.base,
        active_tab = active_tab,
        inactive_tab = inactive_tab,
        inactive_tab_hover = active_tab,
        new_tab = inactive_tab,
        new_tab_hover = active_tab,
        inactive_tab_edge = palette.muted,
    },
}

return color
