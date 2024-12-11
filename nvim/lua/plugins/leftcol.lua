return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "BufReadPost",

		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { 'treesitter', 'indent' }
			end
		},
		init = function()
			vim.keymap.set("n", "zx", function()
				require('ufo').enable()
			end)
			vim.keymap.set("n", "zR", function()
				require('ufo').openAllFolds()
			end)
			vim.keymap.set("n", "zM", function()
				require('ufo').closeAllFolds()
			end)
			vim.keymap.set("n", "zr", function()
				require('ufo').openFoldsExceptKinds()
			end)
			vim.keymap.set("n", "zm", function()
				require('ufo').closeFoldsWith()
			end)
			vim.keymap.set("n", "K", function()
				local winid = require('ufo').peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end)
		end,
	},
	{
		"luukvbaal/statuscol.nvim",
		opts = function ()
			local builtin = require('statuscol.builtin')
			return {
				setopt = true,
				-- override the default list of segments with:
				-- number-less fold indicater, the signs, then line number & separator
				segments = {
					{ text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
					{ text = { '%s' }, click = 'v:lua.ScSa' },
					{
						text = { builtin.lnumfunc, ' ' },
						condition = { true, builtin.not_empty },
						click = 'v:lua.ScLa',
					},
				},
			}
		end
	}
}
