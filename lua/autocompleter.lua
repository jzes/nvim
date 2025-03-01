local autocompleter = {}

function autocompleter.config(cmp)

	cmp.setup({
		completion = {
			autocomplete = false,
		},
	  mapping = {
		["<C-Space>"] = cmp.mapping.complete(), -- Abrir menu de sugestões
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar a seleção com Enter
		["<Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_next_item() -- Navegar para o próximo item
		  else
			fallback() -- Caso contrário, usar o comportamento padrão
		  end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item() -- Navegar para o item anterior
		  else
			fallback() -- Caso contrário, usar o comportamento padrão
		  end
		end, { "i", "s" }),
	  },
	  sources = {
		{ name = "nvim_lsp" }, -- Fonte do LSP
		{ name = "buffer" }, -- Sugestões baseadas no buffer atual
		{ name = "path" }, -- Sugestões de caminhos de arquivos
	  },
	  window = {
		completion = cmp.config.window.bordered(), -- Bordas para o menu de autocompletar
		documentation = cmp.config.window.bordered(), -- Bordas para a documentação
	  },
	})

end

return autocompleter
