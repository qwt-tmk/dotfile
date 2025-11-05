local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- Font
-- brew install font-jetbrains-mono-nerd-font
-- brew install font-cica
local font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font",
  "Cica"
})

config.font = font
config.font_size = 13
config.window_frame = {
  font = font,
  font_size = 20,
}

-- Activate bell sound
config.audible_bell = "SystemBeep"

-- Appearance
-- config.color_scheme = 'Kanagawa Dragon (Gogh)'
config.color_scheme = 'Kanagawa (Gogh)'
config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = false
config.tab_max_width = 100
config.tab_bar_at_bottom = false
config.window_padding = {
  top = 3,
  bottom = 5,
}

require 'keymaps'.apply_to_config(config)
require 'tabline'

return config
