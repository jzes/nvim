local lspconfiger = {}

function lspconfiger.config(on_attach)

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {"gopls", "lua_ls", "rust_analyzer", "pyright"}
	})

	local lspconfig = require("lspconfig")
	require("mason-lspconfig").setup_handlers({function (server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end})

	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				runtime = {
					-- Indica qual versão do Lua está sendo usada
					version = "LuaJIT",
				},
				diagnostics = {
					-- Reconhece a variável global `vim`
					globals = { "vim" },
				},
				workspace = {
					-- Faz o LSP reconhecer os arquivos runtime do Neovim
					library = vim.api.nvim_get_runtime_file("", true),
					-- Evita avisos sobre arquivos que não fazem parte do workspace
					checkThirdParty = false,
				},
			},
		},
	})

	local mason_registry = require('mason-registry')
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

	lspconfig.ts_ls.setup {
		-- Initial options for the TypeScript language server
		init_options = {
			plugins = {
				{
					-- Name of the TypeScript plugin for Vue
					name = '@vue/typescript-plugin',

					-- Location of the Vue language server module (path defined in step 1)
					location = vue_language_server_path,

					-- Specify the languages the plugin applies to (in this case, Vue files)
					languages = { 'vue' },
				},
			},
		},

		-- Specify the file types that will trigger the TypeScript language server
		filetypes = {
			'typescript',          -- TypeScript files (.ts)
			'javascript',          -- JavaScript files (.js)
			'javascriptreact',     -- React files with JavaScript (.jsx)
			'typescriptreact',     -- React files with TypeScript (.tsx)
			'vue'                  -- Vue.js single-file components (.vue)
		},
	}

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		float = {
			border = "rounded", -- Bordas arredondadas para janelas de diagnóstico
		},
	})
end

return lspconfiger
