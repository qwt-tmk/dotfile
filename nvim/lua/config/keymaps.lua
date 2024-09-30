local kmp = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
kmp.set("n", "x", '"_x')

-- Increment/decrement
-- kmp.set("n", "+", "<C-a>")
-- kmp.set("n", "-", "<C-x>")

-- Delete a word backwards
kmp.set("n", "dw", 'vb"_d')

-- Move the cursor to the right edge
kmp.set("n", "-", "$")

-- Select all
kmp.set("n", "<C-a>", "gg<S-v>G")

-- Split window
kmp.set("n", "ss", ":split<Return>", opts)
kmp.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
-- these are in config/plugins/tmux.lua
-- kmp.set("n", "<C-h>", "<C-w>h")
-- kmp.set("n", "<C-k>", "<C-w>k")
-- kmp.set("n", "<C-j>", "<C-w>j")
-- kmp.set("n", "<C-l>", "<C-w>l")
-- kmp.set("n", "<C-/>", "<C-w>p")

-- Resize window
kmp.set("n", "<A-h>", "<C-w><")
kmp.set("n", "<A-l>", "<C-w>>")
kmp.set("n", "<A-j>", "<C-w>+")
kmp.set("n", "<A-k>", "<C-w>-")

-- Emacs key binds in insert mode
kmp.set("i", "<C-f>", "<right>", opts)
kmp.set("i", "<C-b>", "<left>", opts)
kmp.set("i", "<C-n>", "<down>", opts)
kmp.set("i", "<C-p>", "<up>", opts)
kmp.set("i", "<C-e>", "<end>", opts)
kmp.set("i", "<C-a>", "<home>", opts)
kmp.set("i", "<C-o>", "<esc>o", opts)

-- barbar keymap
kmp.set("n", "<TAB>", "<Cmd>BufferNext<CR>", opts)
kmp.set("n", "<S-TAB>", "<Cmd>BufferPrevious<CR>", opts)
kmp.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
kmp.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
kmp.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
kmp.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
kmp.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts) -- Magic buffer-picking mode

-- nvim-tree keymap
kmp.set("n", "<leader>fl", "<Cmd>NvimTreeToggle<CR>", opts)
kmp.set("n", "<leader>fk", "<Cmd>NvimTreeFocus<CR>", opts)

-- format by lsp
kmp.set("n", "gq", "<Cmd>lua vim.lsp.buf.format()<CR>", opts)
