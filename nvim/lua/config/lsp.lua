vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/opt/homebrew/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

vim.lsp.config('vue_ls', {
  init_options = {
    typescript = {
      tsdk = '/opt/homebrew/lib/node_modules/typescript/lib'
    }
  },
  before_init = function (params, config)
    local lib_path = vim.fs.find('node_modules/typescript/lib', { path = new_root_dir, upward = true })[1]
    if lib_path then
      config.init_options.typescript.tsdk = lib_path
    end

  end
})

vim.lsp.enable({
  'gopls',
  'lua_ls',
  'vue_ls',
  'ts_ls',
  'graphql',
  'terraformls'
})
