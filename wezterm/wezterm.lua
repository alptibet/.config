local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	window_background_opacity = 0.99,
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	color_scheme = "tokyonight_night",
	font_size = 14,
	line_height = 1.05,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	window_decorations = "RESIZE",
	enable_tab_bar = false,
	keys = {
		{ key = "x", mods = "CTRL | ALT", action = act.ShowTabNavigator },
		{
			key = "p",
			mods = "CTRL | ALT",
			action = act.PaneSelect({
				alphabet = "123456789",
			}),
		},
		{ key = "1", mods = "CTRL | ALT", action = act.ActivatePaneByIndex(0) },
		{ key = "2", mods = "CTRL | ALT", action = act.ActivatePaneByIndex(1) },
		{ key = "3", mods = "CTRL | ALT", action = act.ActivatePaneByIndex(2) },
		{ key = "4", mods = "CTRL | ALT", action = act.ActivatePaneByIndex(3) },
		{ key = "b", mods = "CTRL | ALT", action = act.CloseCurrentPane({ confirm = false }) },
	},
}
return config
