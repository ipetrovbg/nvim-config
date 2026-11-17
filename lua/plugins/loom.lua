return {
  "digitine-software/loom.nvim",
  name = "loom.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  config = function()
    require("loom").setup({
      rename_key = "<leader>rl",
    })
    require("telescope").load_extension("loom")
  end,
}
