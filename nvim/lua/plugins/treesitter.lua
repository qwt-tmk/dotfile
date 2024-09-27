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
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
