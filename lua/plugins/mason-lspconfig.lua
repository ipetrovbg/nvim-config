local opts = {
	ensure_installed = {
		"ts_ls",
		"cssmodules_ls",
		"emmet_ls",
		"html",
		"lua_ls",
		"elmls",
		"rust_analyzer",
		"eslint",
		"jsonls",
		"yamlls",
		"graphql",
	},

	automatic_installation = true,
	max_concurrent_installers = 4,
}

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	opts = opts,
	event = "BufReadPre",
}
