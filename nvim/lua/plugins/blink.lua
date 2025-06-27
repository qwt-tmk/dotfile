return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.icons',
  },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    cmdline = {
      enabled = true,
      keymap = { preset = 'cmdline' },
      completion = { menu = { auto_show = true} },
      sources = { 'buffer', 'cmdline' },
    },

    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_on_insert = false,
        blocked_trigger_characters = {'(', ',', '-', '_'},
        blocked_retrigger_characters = {'(', ',', '-', '_'},
      },
      window = {
        border = 'rounded',
        show_documentation = true,
      },
    },

    completion = {
      menu = {
        border = 'rounded',
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require('mini.icons').get('lsp', ctx.king)
              end
            }
          }
        }
      },
      documentation = { auto_show = true, window = { border = 'rounded' } },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    keymap = {
      preset = 'default',
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-e>'] = false, -- disable
      ['<C-c>'] = { 'show', 'hide', 'fallback' },
      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' }, -- override default sig help
      ['<ENTER>'] = { 'select_and_accept', 'fallback'},
    },

  },

  opts_extend = { "sources.default" }
}
