return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
      enable_check_bracket_line = false,
    }
  },
  {
    'windwp/nvim-ts-autotag',
    config = function(_, opts)
      require('nvim-ts-autotag').setup({
        opts = {
          enable_rename = true
        }
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'gruvbox',
        disabled_filetypes = { 'NvimTree' }
      },
    }
  },
  {
    'romgrk/barbar.nvim',
    -- key mappings are in keymap.lua
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      insert_at_end = true,
      icons = {
        pinned = { button = '', filename = true },
      },
      sidebar_filetypes = {
        NvimTree = true,
      },
    }
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          require('nvim-tree.api').config.mappings.default_on_attach(bufnr)
        end,
        filters = {
          dotfiles = true,
        },
        update_focused_file = {
          enable = true,
        }
      })
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp"
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.scroll_docs(-4),
          ['<C-j>'] = cmp.mapping.scroll_docs(4),
          ['<C-l>'] = cmp.mapping.complete(),
          ['<C-c>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function(_, opts)
      require('mini.surround').setup({
        custom_surroundings = nil,
        highlight_duration = 50,
        mappings = {
          add = 'sa',
          delete = 'sd',
          find = 'sf',
          find_left = 'sF',
          highlight = 'sh',
          replace = 'sr',
          update_n_lines = 'sn',
          suffix_last = 'l',
          suffix_next = 'n',
        },
        n_lines = 20,
      })
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim'
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-golang"),
        },
      })
    end,
    keys = {
      {
        "<leader>tt",
        function()
          require('neotest').run.run()
        end
      },
      {
        "<leader>te",
        function()
          require('neotest').output_panel.toggle()
        end
      },
      {
        "<leader>ts",
        function()
          require('neotest').summary.toggle()
        end
      }
    }
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
    keys = {
      {
        "<leader>rn",
        function ()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true
      }
    }
  }
}
