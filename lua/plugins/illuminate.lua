return {
	"RRethy/vim-illuminate",
	lazy = true,
	event = { "BufReadPre", "BufNewFile", "BufRead" },
	branch = "master",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			-- delay: delay in milliseconds
			delay = 50,
		})
	end,
}
