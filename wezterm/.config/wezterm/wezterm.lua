local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "zenbones_dark"

-- Disable the tab bar
config.enable_tab_bar = false
config.tab_max_width = 0

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.max_fps = 120

-- Set the font to a Nerd Font
config.font = wezterm.font("DejaVuSansM Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- and finally, return the configuration to wezterm

-- Use ALT instead of SHIFT to bypass application mouse reporting
config.bypass_mouse_reporting_modifiers = "ALT"

-- Make URLs clickable
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make Rally Defects, Stories and Features clickable
table.insert(config.hyperlink_rules, {
	regex = [[\b(?:DE|S|F|TC)(\d+)\b]],
	format = "https://rally1.rallydev.com/#/618851404575d/search?keywords=$0",
})

return config
