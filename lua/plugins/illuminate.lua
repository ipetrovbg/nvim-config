require('illuminate').configure({
	providers = {
		'lsp',
		'treesitter',
		'regex',
	},
	-- delay: delay in milliseconds
	delay = 50,
})
