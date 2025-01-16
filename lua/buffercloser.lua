local buffercloser = {}

function buffercloser.close()
	local current_buff_number = vim.api.nvim_get_current_buf()
	local buffs = vim.fn.getbufinfo({ buflisted = true })

	if #buffs > 1 then
		for _, buff in ipairs(buffs) do
			if buff.bufnr ~= current_buff_number then
				vim.api.nvim_set_current_buf(buff.bufnr)
				break
			end
		end
	end
	vim.cmd("bd " .. current_buff_number)
end

return buffercloser
