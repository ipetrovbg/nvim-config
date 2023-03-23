-- local status_ok, treesitter_config = pcall(require("nvim-treesitter.configs"))

-- if not status_ok then
	-- print("treesitter.configs", treesitter_config)
-- end

-- Doesn't work for some reason: attempt to call a table value
require "nvim-treesitter.configs".setup {
	  -- ensure_installed = { "rust", "lua", "vim", "help", "query", "typescript" },
	   -- Install parsers synchronously (only applied to `ensure_installed`)
	  sync_install = true,

	  -- Automatically install missing parsers when entering buffer
	  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	  auto_install = false,

	  -- List of parsers to ignore installing (for "all")
	  ignore_install = { "" },
	  indent = { enabled = true },
	  highlight = { enabled = true },
	  additional_vim_regex_highlighting = true,
      playground = {
		enable = true,
		disable = { "" },
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		-- keybindings = {
		--   toggle_hl_groups = '|',
		--   show_help = '<Space>',
	    -- },
	  }
	  -- query_linter = {
       -- enable = true,
       -- use_virtual_text = true,
       -- lint_events = {"BufWrite", "CursorHold"},
      -- },
}
