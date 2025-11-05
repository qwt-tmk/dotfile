local module = {}

local wezterm = require 'wezterm'
local action = wezterm.action

function module.apply_to_config(config)
  config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
  config.keys = {
    -- Shift + Enter to new line
    {
      key = 'Enter',
      mods = 'SHIFT',
      action = action.SendString('\n')
    },
    -- yen char to backslash char
    {
      key = "¥",
      action = action.SendKey { key = '\\' }
    },
    -- zoom mode
    {
      key = 'z',
      mods = 'LEADER',
      action = action.TogglePaneZoomState,
    },
    -- split panes
    {
      key = '%',
      mods = 'LEADER',
      action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '"',
      mods = 'LEADER',
      action = action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Controll panes
    {
      key = 'h',
      mods = 'LEADER',
      action = action.ActivatePaneDirection 'Left',
    },
    {
      key = 'j',
      mods = 'LEADER',
      action = action.ActivatePaneDirection 'Down',
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = action.ActivatePaneDirection 'Up',
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = action.ActivatePaneDirection 'Right',
    },
    {
      key = 'x',
      mods = 'LEADER',
      action = action.CloseCurrentPane { confirm = false },
    },
    {
      key = 'p',
      mods = 'LEADER',
      action = action.PaneSelect,
    },
    {
      key = 'p',
      mods = 'LEADER|CTRL',
      action = action.PaneSelect { mode = 'SwapWithActive' },
    },
    -- resize pane
    {
      key = 'h',
      mods = 'SHIFT|OPT',
      action = action.AdjustPaneSize { 'Left', 1 },
    },
    {
      key = 'l',
      mods = 'SHIFT|OPT',
      action = action.AdjustPaneSize { 'Right', 1 },
    },
    {
      key = 'k',
      mods = 'SHIFT|OPT',
      action = action.AdjustPaneSize { 'Up', 1 },
    },
    {
      key = 'j',
      mods = 'SHIFT|OPT',
      action = action.AdjustPaneSize { 'Down', 1 },
    },
    -- move tabs
    {
      key = 'LeftArrow',
      mods = 'LEADER',
      action = action.MoveTabRelative(-1),
    },
    {
      key = 'RightArrow',
      mods = 'LEADER',
      action = action.MoveTabRelative(1),
    },
    {
      key = 'n',
      mods = 'LEADER',
      action = action.ActivateTabRelative(-1),
    },
    {
      key = 'm',
      mods = 'LEADER',
      action = action.ActivateTabRelative(1),
    },
    -- scroll
    {
      key = '[',
      mods = 'LEADER',
      action = action.ActivateCopyMode,
    },
    -- rename tab
    {
      key = ',',
      mods = 'LEADER',
      action = action.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if the hit escape without entering anything
          -- An empty string if the just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }
    },

    -- workspace
    {
      key = 's',
      mods = 'LEADER',
      action = action.ShowLauncherArgs { flags = 'WORKSPACES', title = 'Select workspace' },
    },
    {
      key = '$',
      mods = 'LEADER',
      action = action.PromptInputLine {
        description = '(wezterm) Set workspace title:',
        action = wezterm.action_callback(function(win, pane, line)
          if line then
            wezterm.mux.rename_workspace(
              wezterm.mux.get_active_workspace(),
              line
            )
          end
        end)
      }
    },
  }

  -- tab activation by number
  for i = 1, 9 do
    table.insert(config.keys, {
      key = tostring(i),
      mods = 'LEADER',
      action = action.ActivateTab(i - 1),
    })
  end
  table.insert(config.keys, {
    key = "0",
    mods = 'LEADER',
    action = action.ActivateTab(9),
  })
end

return module
