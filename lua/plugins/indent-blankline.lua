local highlight = {
	"CursorColumn",
	"Whitespace",
}

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	lazy = false,
	opts = {
		indent = { highlight = highlight, char = "│" },
	},
}
