local text = require("text")
local utils = require("utils")
local telescope_args_shortcut = require("telescope-live-grep-args.shortcuts")

local keyset = {}

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function keyset.set()
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	set_keymap = vim.api.nvim_set_keymap
	basic_ops = {noremap = true, silent = true}
	expression_ops = {silent = true, noremap = true, expr = true, replace_keycodes = false}
	
	vim.keymap.set("n", "<leader>f", text.find_in_current_buffer, { desc = "Buscar no buffer atual com live_grep_args" })
	vim.keymap.set("n", "<leader>fg", telescope_args_shortcut.grep_word_under_cursor)
	vim.keymap.set("n", "<leader>ft", telescope_args_shortcut.grep_word_under_cursor_current_buffer)
	vim.keymap.set("n", "<leader>fr", text.seek_n_replace, { desc = "Busca e substitui" })
	vim.api.nvim_set_keymap('i', '<C-d>', "CocActionAsync('showSignatureHelp')", { silent = true, expr = true })
	
	set_keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', utils.add_field(expression_ops, "desc", "-> seleciona o autocompleet no coc"))
	set_keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], utils.add_field(expression_ops, "desc", "-> seleciona o autocompleet no coc invertido"))
	-- Make <CR> to accept selected completion item or notify coc.nvim to format
	-- <C-g>u breaks current undo, please make your own choice
	set_keymap("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], utils.add_field(expression_ops, "desc", "-> aceita o autocomplete no coc"))
	-- Use <c-j> to trigger snippets
	set_keymap("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)", utils.add_field(expression_ops, "desc", "-> expande um snippet"))
	-- Use <c-space> to trigger completion
	set_keymap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true, desc = "-> chama o autocomplete"})
	set_keymap("n", "<leader>rn", "<plug>(coc-rename)", {silent = true, desc = "-> renomeia coisas"})

	set_keymap('n', '<leader>ff', ':Files<CR>', utils.add_field(basic_ops, "desc", "-> Busca arquivos"))
	set_keymap('n', '<leader>FF', ':AllFiles<CR>', utils.add_field(basic_ops, "desc", "-> Busca todos os arquivos"))
	set_keymap('n', '<leader>b', ':Telescope buffers<CR>', utils.add_field(basic_ops, "desc", "-> Lista Buffers [Tl]"))
	set_keymap('n', '<leader>h', ':History<CR>', utils.add_field(basic_ops, "desc", "-> Historico"))
	set_keymap('n', '<leader>r', ':Rg<CR>', utils.add_field(basic_ops, "desc", "-> Busca por termos no projeto"))
	--[[ set_keymap('n', '<leader>R', ':Rg<space>', utils.add_field(basic_ops, "desc", "")) ]]
	set_keymap('n', '<leader>gb', ':GBranches<CR>', utils.add_field(basic_ops, "desc", "-> Lista branches"))
	set_keymap('n', '<leader>n', ':enew<CR>', utils.add_field(basic_ops, "desc", "-> Cria novo arquivo"))
	set_keymap('n', 'gd', '<Plug>(coc-definition)', utils.add_field(basic_ops, "desc", "-> [trocar] Busca definitions"))
	set_keymap('n', 'gy', '<Plug>(coc-type-definition)', utils.add_field(basic_ops, "desc", "-> [trocar]Busca definition do tipo"))
	set_keymap('n', 'gi', '<Plug>(coc-implementation)', utils.add_field(basic_ops, "desc", "-> [trocar]Busca Implementação"))
	set_keymap('n', 'gr', '<Plug>(coc-references)', utils.add_field(basic_ops, "desc", "-> [trocar]Busca Referencias"))
	set_keymap('n', 'rn', '<Plug>(coc-rename)', utils.add_field(basic_ops, "desc", "-> Renomeia"))
	set_keymap('n', 'nt', ':BufferLineCycleNext<CR>', utils.add_field(basic_ops, "desc", "-> Próximo buffer"))
	set_keymap('n', 'NT', ':BufferLineCyclePrev<CR>', utils.add_field(basic_ops, "desc", "-> Buffer anterior"))
	set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', utils.add_field(basic_ops, "desc", "-> Abre a arvore de arquivos"))
	set_keymap('v', '<leader>a', '<Plug>(coc-codeaction-selected)', utils.add_field(basic_ops, "desc", "-> [trocar] lista as codeactions"))
	set_keymap('n', '<C-d>', ":call CocAction('expandSelection')<CR>", utils.add_field(basic_ops, "desc", "-> autocomplete sugestions"))
	set_keymap('v', '<C-d>', ":call CocAction('expandSelection')<CR>", utils.add_field(basic_ops, "desc", "-> autocomplete sugestions"))
	set_keymap('n', '<leader><leader>', ':Telescope keymaps<CR>->',  utils.add_field(basic_ops, "desc", "-> lista os atalhos"))
	set_keymap('n', '<C-l>', 'dlp', utils.add_field(basic_ops, "desc", "-> move o caracter pro lado"))
	set_keymap('v', '<C-l>', 'd`>p', utils.add_field(basic_ops, "desc", "-> [WIP] mover o selecionado pra esquerda"))
	set_keymap('n', '<C-h>', 'dlhhp', utils.add_field(basic_ops, "desc", "-> move o caracter pro lado"))
	vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
	vim.api.nvim_create_augroup("CocGroup", {})
	vim.api.nvim_create_autocmd("CursorHold", {
	    group = "CocGroup",
	    command = "silent call CocActionAsync('highlight')",
	    desc = "Highlight symbol under cursor on CursorHold"
	})

end

return keyset
