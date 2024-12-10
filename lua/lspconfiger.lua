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

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		float = {
			border = "rounded", -- Bordas arredondadas para janelas de diagnóstico
		},
	})
end

return lspconfiger
