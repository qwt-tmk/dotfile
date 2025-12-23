-- Vue周りの設定
local root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  -- locationにはNodeモジュール解決ができるパスを入れる.
  -- ここがvuejsのWikiだと実行バイナリパスになっており間違っているので注意.
  -- プロジェクトで`@vue/typescript-plugin`を開発用にインストールする必要あり.
  location = root_dir(vim.api.nvim_buf_get_name(0)) .. "/node_modules",
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

-- If you are on most recent `nvim-lspconfig`
local vue_ls_config = {}


vim.lsp.config('gopls', {
  settings = {
    gopls = {
      buildFlags = {"-tags=integration"},
    },
  }
})

vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable({'vtsls', 'vue_ls'})

vim.lsp.enable({
  'gopls',
  'lua_ls',
  'graphql',
  'terraformls',
  'protols',
  'sqls',
  'kotlin_lsp',
})
