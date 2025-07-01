local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require "https://github.com/michaelbrusegard/tabline.wez"
tabline.setup({
  options = {
    icons_enabled = false,
    section_separators = {
      left = wezterm.nerdfonts.ple_upper_left_triangle,
      right = wezterm.nerdfonts.ple_lower_left_triangle,
    },
    component_separators = {
      left = wezterm.nerdfonts.ple_forwardslash_separator,
      right = wezterm.nerdfonts.ple_forwardslash_separator,
    },
    tab_separators = {
      left = wezterm.nerdfonts.ple_upper_left_triangle,
      right = wezterm.nerdfonts.ple_lower_right_triangle,
    },
    tab = {
      active = { fg = '#89b4fa', bg = '#FFFFFF' },
    }
  },
  sections = {
    tabline_b = { '' },
    tab_line_c = { '' },
    tab_active = {
      'index',
      { 'tab', padding = 1 },
      { 'zoomed', padding = 1 },
    },
    tab_inactive = {
      'index',
      { 'tab', padding = 1 },
      { 'zoomed', padding = 1 },
    }
  }
})

tabline.set_theme("Kanagawa (Gogh)", {
    -- see colors at https://github.com/Gogh-Co/Gogh?tab=readme-ov-file#theme-yml-template
    tab = {
      active = { fg = '#FFCB6B', bg = '#292D3E' },
      inactive = { fg = '#959DCB', bg = '#292D3E' },
    }
})
