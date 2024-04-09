-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
-- This is where you actually apply your config choices

-- config.window_background_opacity = 0.95
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" })
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = "nordic"
config.font_size = 13
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
-- and finally, return the configuration to wezterm
return config
