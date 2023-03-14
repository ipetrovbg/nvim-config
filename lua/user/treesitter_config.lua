require'nvim-treesitter.configs'.setup {
	  ensure_installed = { "rust", "lua", "vim", "help", "query", "typescript" },
	   -- Install parsers synchronously (only applied to `ensure_installed`)
	  sync_install = true,

	  -- Automatically install missing parsers when entering buffer
	  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	  auto_install = true,

	  -- List of parsers to ignore installing (for "all")
	  -- ignore_install = { "javascript" },
	  indent = { enabled = true },
	  highlight = { enabled = true },
}
