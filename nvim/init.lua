vim.loader.enable()

-- disabel netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("config.options")
require("config.keymaps")

vim.cmd("colorscheme kanagawa-dragon")

-- Let mini.completion use <CR>
local keycode = vim.keycode or function(x)
  return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
  ['cr'] = keycode('<CR>'),
  ['ctrl-y'] = keycode('<C-y'),
  ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    return keys['cr']
  end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action', { expr = true})
-- mini.complete end
