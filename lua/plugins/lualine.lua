require('lualine').setup {
	options = {
		theme = 'gruvbox',
		globalstatus = true,
	},
	tabline = {
		lualine_a = {'filename'},
		lualine_b = {'diagnostics'},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	winbar = {
 		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff'},
    lualine_c = {},
    lualine_x = {'branch'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
