local utils = {}

function utils.add_field(tbl, key, value)
	new_t = {}
	for k,v in pairs(tbl) do
		new_t[k] = v
	end
	new_t[key] = value
	return new_t
end


return utils
