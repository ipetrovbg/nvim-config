return {
	"williamboman/mason.nvim",
	-- dependencies = { "williamboman/mason-lspconfig.nvim" },
	cmd = "Mason",
	event = "BufReadPre",
	opts = {
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
