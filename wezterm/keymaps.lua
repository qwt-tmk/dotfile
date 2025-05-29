local module = {}

local wezterm = require 'wezterm'
local action = wezterm.action

function module.apply_to_config(config)
	config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
	config.keys = {
		-- yen char to backslash char
		{
			key = "¥",
			action = action.SendKey { key = '\\' }
		},
		-- split panes
		{
			key = 's',
			mods = 'LEADER',
			action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
		},
		{
			key = 'v',
			mods = 'LEADER',
			action = action.SplitVertical { domain = 'CurrentPaneDomain' },
		},
		-- Move
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
