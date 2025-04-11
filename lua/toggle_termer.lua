local toggle_termer = {}

function toggle_termer.config()
	require("toggleterm").setup{
		size = 20, -- Tamanho do terminal (pode ser ajustado conforme necessário)
		open_mapping = [[<c-\>]], -- Atalho para abrir o terminal (Ctrl + \)
		hide_numbers = true, -- Esconde a numeração das linhas quando o terminal está ativo
		shade_terminals = false, -- Aplica um efeito de sombreado no terminal
		direction = 'float', -- Terminal flutuante
		float_opts = {
			border = 'curved', -- Estilo de borda (pode ser 'single', 'double', 'shadow', etc.)
			winblend = 0, -- Transparência da janela flutuante
		},
		close_on_exit = true, -- Fecha o terminal quando o processo é encerrado
		shell = vim.o.shell,
	}
end

return toggle_termer
