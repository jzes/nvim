local bufferliner = {}

function bufferliner.config()
	require("bufferline").setup({
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
		options = {
			numbers = "none", -- Não mostrar números de buffers
			close_command = "bdelete! %d",       -- Comando para fechar o buffer
			right_mouse_command = "bdelete! %d", -- Comando para fechar o buffer com o botão direito
			left_mouse_command = "buffer %d",    -- Comando para mudar de buffer clicando com o botão esquerdo
			indicator = {
				icon = '', -- Ícone ao lado do buffer ativo
				style = 'icon',
			},
			buffer_close_icon = '',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 18,
			diagnostics = "nvim_lsp", -- Integração com o LSP
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true
				}
			},
			show_buffer_icons = true, -- Mostrar ícones de arquivo
			show_buffer_close_icons = true,
			show_close_icon = false,
			persist_buffer_sort = true,
			separator_style = "thin", -- Estilo de separador, pode ser "slant", "thick", etc.
			enforce_regular_tabs = true,
			always_show_bufferline = true,
		highlights = {
			buffer_selected = {
						guifg = '#A6E3A1',   -- Cor do ícone do buffer ativo
				}
			},
		},
	})
end

return bufferliner
