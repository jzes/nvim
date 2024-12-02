local formater = {}

function formater.set_json_formater()
	vim.api.nvim_create_user_command(
		'FormatJson', 
		function() 
			vim.cmd('%!jq .')
		end, 
		{})
end

function formater.format_markdown()
	vim.cmd([[silent! write]]) -- Salva o arquivo antes de formatar
	vim.cmd([[silent! !mdformat %]]) -- Executa o mdformat no arquivo atual
	vim.cmd([[edit]]) -- Recarrega o arquivo formatado no buffer
end


function formater.set_markdown_formater()
	require('markdown-table-mode').setup()
	--barbar = true
	
	vim.api.nvim_create_user_command(
		'FormatMarkdown',
		formater.format_markdown,
		{desc = "formata markdown"}
	)

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.md",
		callback = formater.format_markdown,
	})

end

return formater
