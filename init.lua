require("installer").install()

local configer = require("configer")
local fzf = require("fzf")
local keyset = require("keyset")
local telescoper = require("telescoper")
local formater = require("formater")
local catppucciner = require("catppucciner")
local bufferliner = require("bufferliner")
local lualiner = require("lualiner")
local toggle_termer = require("toggle_termer")
local tree = require("tree")
local lspconfiger = require("lspconfiger")
local cmp = require("cmp")
local autocompleter = require("autocompleter")


configer.config_basic()
configer.config_style()
configer.config_gen()

fzf.configure()
telescoper.config()

formater.set_json_formater()
formater.set_markdown_formater()

catppucciner.config()

vim.ui.select = require('dropbar.utils.menu').select
require('Comment').setup()
bufferliner.config()
lualiner.config()
toggle_termer.config()
tree.config()

keyset.set()
lspconfiger.config(keyset.On_attach)
autocompleter.config(cmp)

require("noice").setup({
	cmdline = {
		enabled = true, -- Mostra o `:` em uma janela flutuante
	--	view = "cmdline", -- Estilo da barra de comando
	},
	messages = {
		enabled = true, -- Substitui mensagens padrão
	--	view = "notify", -- Mostra mensagens com o `notify`
	},
	lsp = {
		progress = {
			enabled = true, -- Exibe progresso de operações do LSP
		},
		override = {
			-- Substitui as mensagens padrão do LSP
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		hover = {
			enabled = true, -- Usa Noice para hover
		},
		signature = {
			enabled = true, -- Usa Noice para assinatura de métodos
		},
	},
	presets = {
		bottom_search = false, -- Caixa de busca no rodapé
		command_palette = true, -- Simula uma paleta de comandos
		long_message_to_split = true, -- Mensagens longas vão para uma janela separada
		inc_rename = false, -- Desativa renomeação incremental (caso use outros plugins)
		lsp_doc_border = true, -- Adiciona borda arredondada a popups do LSP
	},
	views = {
		telescope = {
			layout_strategy = "vertical",
      		layout_config = {
        		width = 0.8,
       			height = 0.8,
        		preview_cutoff = 120,
			},
		},
		cmdline_popup = {
			border = {
				style = "rounded", -- Define bordas arredondadas
				-- padding = { 1, 1 },
			},
			win_options = {
				winblend = 10, -- Torna transparente
			},
		},
		-- popupmenu = {
		-- 	relative = "editor", -- Centraliza o menu de autocompletar
		-- 	position = {
		-- 		row = 10,
		-- 		col = "50%",
		-- 	},
		-- 	size = {
		-- 		width = 60,
		-- 		height = 10,
		-- 	},
		-- 	border = {
		-- 		style = "rounded",
		-- 		padding = { 1, 1 },
		-- 	},
		-- },
	},
})


