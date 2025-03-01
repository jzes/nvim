local text = require("text")
local utils = require("utils")
local telescope_args_shortcut = require("telescope-live-grep-args.shortcuts")
local buffercloser = require("buffercloser")

local keyset = {}

-- dividir essa função em funçoes menores
-- repensar esse esquema do on atach
function keyset.on_attach(client, bufnr)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	if not bufnr or bufnr == 0 then
    	bufnr = vim.api.nvim_get_current_buf()
  	end


	-- Verifica se o servidor suporta o recurso de Document Highlight
	if client.server_capabilities.documentHighlightProvider then
    -- Define autocmds para iniciar e limpar o realce
    	vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = true })
    	vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      		group = 'LspDocumentHighlight',
      		buffer = bufnr,
      		callback = vim.lsp.buf.document_highlight,
    	})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'LspDocumentHighlight',
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

	-- Atalhos padrão para LSP
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gr", vim.lsp.buf.references, utils.add_field(bufopts, "desc", ""))
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, utils.add_field(bufopts, "desc", "-> Busca pela definição do que esta no cursor"))
	vim.keymap.set("n", "K", vim.lsp.buf.hover, utils.add_field(bufopts, "desc", "-> Mostra a documentação"))
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, utils.add_field(bufopts, "desc", ""))
end

function keyset.set()
	vim.o.timeoutlen = 2000
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	local set_keymap = vim.api.nvim_set_keymap
	local basic_ops = {noremap = true, silent = true}

	vim.keymap.set("n", "<leader>f", text.find_in_current_buffer, { desc = "Buscar no buffer atual com live_grep_args" })
	vim.keymap.set("n", "<leader>ftg", telescope_args_shortcut.grep_word_under_cursor)
	vim.keymap.set("n", "<leader>ft", telescope_args_shortcut.grep_word_under_cursor_current_buffer)
	vim.keymap.set("n", "<leader>fr", text.seek_n_replace, { desc = "Busca e substitui" })

	set_keymap('n', '<leader>ff', ':Files<CR>', utils.add_field(basic_ops, "desc", "-> Busca arquivos"))
	set_keymap('n', '<leader>FF', ':AllFiles<CR>', utils.add_field(basic_ops, "desc", "-> Busca todos os arquivos"))
	set_keymap('n', '<leader>b', ':Telescope buffers<CR>', utils.add_field(basic_ops, "desc", "-> Lista Buffers [Tl]"))
	set_keymap('n', '<leader>h', ':History<CR>', utils.add_field(basic_ops, "desc", "-> Historico"))
	set_keymap('n', '<leader>F', ':Rg<CR>', utils.add_field(basic_ops, "desc", "-> Busca por termos no projeto"))
	set_keymap('n', '<leader>gb', ':GBranches<CR>', utils.add_field(basic_ops, "desc", "-> Lista branches"))
	set_keymap('n', '<leader>n', ':enew<CR>', utils.add_field(basic_ops, "desc", "-> Cria novo arquivo"))
	set_keymap('n', 'nt', ':BufferLineCycleNext<CR>', utils.add_field(basic_ops, "desc", "-> Próximo buffer"))
	set_keymap('n', 'NT', ':BufferLineCyclePrev<CR>', utils.add_field(basic_ops, "desc", "-> Buffer anterior"))
	set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', utils.add_field(basic_ops, "desc", "-> Abre a arvore de arquivos"))
	set_keymap('n', '<leader><leader>', ':Telescope keymaps<CR>->',  utils.add_field(basic_ops, "desc", "-> lista os atalhos"))
	set_keymap('n', '<C-l>', 'dlp', utils.add_field(basic_ops, "desc", "-> move o caracter pro lado direito"))
	set_keymap('v', '<C-l>', 'd`>p', utils.add_field(basic_ops, "desc", "-> [WIP] mover o selecionado pra esquerda"))
	set_keymap('n', '<C-h>', 'dlhhp', utils.add_field(basic_ops, "desc", "-> move o caracter pro lado esquerdo"))
	vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

	vim.keymap.set("n", "<leader>r", ":Telescope lsp_references<CR>", utils.add_field(basic_ops, "desc", "-> Busca as referencias do que esta no cursor"))
	vim.keymap.set("n", "<leader>i", ":Telescope lsp_implementations<CR>", utils.add_field(basic_ops, "desc", "-> Busca as implementações do que esta no cursor"))
	vim.keymap.set('n', '<leader>d', ':Telescope lsp_definitions<CR>', utils.add_field(basic_ops, "desc", "-> Busca pela definição do que esta no cursor"))
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true, desc = "-> LSP Rename" })
	vim.keymap.set('n', '<leader>c', buffercloser.close, { noremap = true, silent = true, desc = "-> Close buffers" })
	vim.keymap.set('n', '<leader>e', function()
  		vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
	end, { noremap = true, silent = true, desc = "-> Abre erros em janela flutuante" })
end

return keyset
