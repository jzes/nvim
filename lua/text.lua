local text = {}

function text.seek_n_replace()
	local search_term = vim.fn.input("Buscar por: ")
	if search_term == "" then
		print("Busca cancelada")
		return
	end
	local replace_term = vim.fn.input("Substituir por: ")
	
	vim.cmd("%s/" .. search_term .. "/" .. replace_term .. "/gc")
end

function text.find_in_current_buffer()
	require("telescope").extensions.live_grep_args.live_grep_args({
	    search_dirs = { vim.fn.expand("%:p") }, -- Busca no buffer atual
	})
end


return text
