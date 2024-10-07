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
kmp.set("n", "<C-m>", "<Cmd>BufferNext<CR>", opts)
kmp.set("n", "<C-n>", "<Cmd>BufferPrevious<CR>", opts)
kmp.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
kmp.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
kmp.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
kmp.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts) -- Magic buffer-picking mode
kmp.set("n", "<C-c>", "<Cmd>BufferClose<CR>", opts) -- Magic buffer-picking mode
kmp.set("n", "<A-c>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)

-- nvim-tree keymap
kmp.set("n", "<leader>fl", "<Cmd>NvimTreeToggle<CR>", opts)
kmp.set("n", "<leader>fk", "<Cmd>NvimTreeFocus<CR>", opts)

-- format by lsp
kmp.set("n", "gq", "<Cmd>lua vim.lsp.buf.format()<CR>", opts)

-- diagnostics on floating window
kmp.set("n", "<leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>")

-- go to defenition
kmp.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
