local mapkey = require("util.keymapper").mapkey

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  lazy = false,
  -- or                              , branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
    "nvim-telescope/telescope-ui-select.nvim",
    "piersolenski/telescope-import.nvim",
    "ThePrimeagen/harpoon",
  },
  keys = {
    mapkey("ff", "Telescope find_files", "n"),
    mapkey("<leader>f", "Telescope live_grep", "n"),
    mapkey("gr", "Telescope lsp_references", "n"),
    mapkey("<leader>qf", "Telescope quickfix", "n"),
    mapkey("<leader>b", "Telescope buffers", "n"),
    mapkey("<leader>r", "Telescope oldfiles", "n"),
    mapkey("<leader>qq", "Telescope diagnostics", "n"),
    mapkey("<leader>l", "Telescope resume", "n"),
    mapkey("<leader>cf", "Telescope current_buffer_fuzzy_find", "n"),
    mapkey("<leader>hh", "Telescope harpoon marks", "n"),
    mapkey("<leader>s", "Telescope lsp_document_symbols", "n"),
  },
  config = function()
    -- vim.api.nvim_create_autocmd("UIEnter", {
    -- 	callback = function()
    -- 		if vim.fn.argv(0) == "" then
    -- 			require("telescope.builtin").find_files()
    -- 		end
    -- 	end,
    -- })

    require("telescope").setup({
      extensions = {
        fzf = {},
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
        ["ui-select"] = {
          -- Custom picket
          lsp_buff_errors = {
            make_index = vim.diagnostic.setloclist,
          },
        },
        import = {
          -- 	-- Add imports to the top of the file keeping the cursor in place
          insert_at_top = true,
        },
        harpoon = {},
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
