local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.window_background_opacity = 0.95
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.color_scheme = "tokyonight"
config.font_size = 16
config.line_height = 1.2
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.keys = {
    { key = "x", mods = "CTRL | ALT", action = wezterm.action.ShowTabNavigator },
}
return config
