-- disabel netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.lsp")

vim.cmd("colorscheme kanagawa-dragon")
