local module = {}
local wezterm = require 'wezterm'
local act = wezterm.action

function module.apply_to_config(config)
  local copy_mode = wezterm.gui.default_key_tables().copy_mode

  table.insert(copy_mode, {
    key = 'y',
    mods = 'NONE',
    action = act.Multiple {
      act.CopyTo 'ClipboardAndPrimarySelection',
      act.ClearSelection,
      act.CopyMode 'ClearSelectionMode',
    },
  })

  config.key_tables = {
    copy_mode = copy_mode,
  }
end

return module
