local kmp = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
kmp.set("n", "x", '"_x')

-- Escape with jj
kmp.set("i", "jj", "<ESC>")

-- Delete a word backwards
kmp.set("n", "dw", 'vb"_d')

-- Move the cursor to the right edge
kmp.set("n", "-", "$")

-- Select all
kmp.set("n", "<C-a>", "gg<S-v>G")

-- Split window
kmp.set("n", "ss", ":split<Return>", opts)
kmp.set("n", "sv", ":vsplit<Return>", opts)

-- Move between pane
kmp.set("n", "<C-h>", "<C-w>h")
kmp.set("n", "<C-l>", "<C-w>l")
kmp.set("n", "<C-j>", "<C-w>j")
kmp.set("n", "<C-k>", "<C-w>k")

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
kmp.set("n", "<leader>m", "<Cmd>BufferNext<CR>", opts)
kmp.set("n", "<leader>n", "<Cmd>BufferPrevious<CR>", opts)
kmp.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
kmp.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
kmp.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
kmp.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts) -- Magic buffer-picking mode
kmp.set("n", "<C-c>", "<Cmd>BufferClose<CR>", opts) -- Magic buffer-picking mode
kmp.set("n", "<A-c>", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", opts)

-- nvim-tree keymap
kmp.set("n", "<leader>fl", "<Cmd>NvimTreeToggle<CR>", opts)
kmp.set("n", "<leader>fk", "<Cmd>NvimTreeFocus<CR>", opts)

-- diagnostics on floating window
kmp.set("n", "<leader>e", vim.diagnostic.open_float)

-- format
kmp.set("n", "gq", vim.lsp.buf.format)

-- go to defenition
kmp.set("n", "gd", vim.lsp.buf.definition)

-- use signature help of Blink
vim.keymap.del('i', '<C-s>')
