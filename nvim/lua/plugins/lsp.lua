return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup({ automatic_installation = true })

			-- LSP configurations
			-- Available LSP servers can be found at mason-lspconfig README

			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- capabilities.textDocument.completion.completionItem.snippetSupport = true


			-- .yaml or .yml ... whatever
			vim.filetype.add({
				pattern = {
					["openapi.*%.ya?ml"] = "yaml.openapi",
					["openapi.*%.json"] = "json.openapi",
				},
			})

			local servers = {
				'black', 'bashls', 'dockerls', 'docker_compose_language_service',
				'gopls', 'markdown_oxide', 'html', 'jsonls', 'vacuum', 'pyright', 'sqlls',
				'terraformls', 'vimls', 'gitlab_ci_ls', 'ts_ls', 'prismals'
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					capabilities = capabilities,
				}
			end

			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
						return
					end
					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = { Lua = {} },
			})

			-- Change diagnostics format
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
				{
					update_in_insert = false,
					virtual_text = {
						format = function(diagnostic)
							return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
						end
					}
				})
		end,
	},
}
