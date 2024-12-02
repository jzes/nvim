local lualiner = {}

function lualiner.config()
	require('lualine').setup{
		options = {
			theme = bubbles_theme,
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = { { 'mode', separator = { right = '', left = '' }, right_padding = 2 } },
			lualine_b = { {'filename', path = 1}, 'branch' },
			lualine_c = {
				'%=', --[[ add your center compoentnts here in place of this comment ]]
			},
			lualine_x = {},
			lualine_y = { 'filetype', 'progress' },
			lualine_z = {
				{ 'location', separator = { right = '', left = ''}, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { 'filename' },
			lualine_b = {},
			lualine_c = {'%='},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'location' },
		},
		tabline = {},
		extensions = {},
	}
end

return lualiner
