local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- Appearance
-- config.color_scheme = 'Kanagawa Dragon (Gogh)'
config.color_scheme = 'Kanagawa (Gogh)'
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none"
}

require'keymaps'.apply_to_config(config)

return config
