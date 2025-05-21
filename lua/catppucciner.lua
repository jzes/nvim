local catppucciner = {}

function catppucciner.config()
	require('catppuccin').setup({
	    flavour = "latte", -- Opções: latte, frappe, macchiato, mocha
	    background = { light = "latte", dark = "mocha" },
		transparent_background = false,
	    integrations = {
	        bufferline = true, -- Ativar integração com bufferline
			nvimtree = {
				enabled = true,
				show_root = true,
				transparent_panel = true,
			}
	    },
	})
	
	vim.cmd.colorscheme "catppuccin"
end

return catppucciner
