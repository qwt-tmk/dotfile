return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"cpp",
				"css",
				"fish",
				"gitignore",
				"go",
				"http",
				"java",
				"php",
				"rust",
				"scss",
				"sql",
				"python",
				"vimdoc",
				"luadoc",
				"vim",
				"lua",
				"markdown",
			},
			incremental_selection = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			folding = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
