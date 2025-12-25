-- Vue周りの設定
-- typescriptのLSPとしてvueを認識するvtslsを使う。
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
vim.lsp.config('vtsls', vtsls_config)

-- Go LSP
-- 結合テスト用に切り出したパッケージをLSPに認識させる
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
    },
  }
})

-- Lua LSP
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- NeovimのランタイムをLSPに見せる（補完/型推論が良くなる）
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

vim.lsp.enable({
  'vtsls', -- npm install -g @vtsls/language-server
  'vue_ls', -- npm install -g @vue/language-server
  'gopls',
  'lua_ls',
  'graphql',
  'terraformls',
  'buf_ls', -- brew install bufbuild/buf/buf
  'sqls',
  'kotlin_lsp',
})
