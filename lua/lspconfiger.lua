local lspconfiger = {}

function lspconfiger.config(on_attach)


	-- Ícones para diagnósticos (opcional, requer uma Nerd Font)
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = true,
			header = "",
			prefix = "",
		},
	})


	require("mason").setup()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local masonLspConfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")

	masonLspConfig.setup({
		automatic_enable = true,
		ensure_installed = {"gopls", "lua_ls", "rust_analyzer", "pyright", "volar"},
		handlers = {function (server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end},
	})

	vim.lsp.config("lua_ls", {
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
		}
	})

	lspconfig.ts_ls.setup {
		-- Initial options for the TypeScript language server
		init_options = {
			plugins = {
				{
					-- Name of the TypeScript plugin for Vue
					name = '@vue/typescript-plugin',


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
		virtual_text = {
			wrap = true, -- Habilita a quebra de linha
			spacing = 4, -- Define o espaçamento entre o texto e o erro
			prefix = "●", -- Adiciona um prefixo (pode ser qualquer caractere)
		},
		signs = true,
		float = {
			border = "rounded", -- Bordas arredondadas para janelas de diagnóstico
		},
	})
end

return lspconfiger
