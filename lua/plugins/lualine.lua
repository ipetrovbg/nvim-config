return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "linrongbin16/lsp-progress.nvim",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", -- gruvbox, tokyonight, catppuccin
        globalstatus = true,
      },
      tabline = {
        lualine_a = { "filename", "diagnostics" },
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = { "mode", "branch" },
        lualine_b = { "diff", "location" },
        lualine_c = {
          require("lsp-progress").progress,
        },

        lualine_x = {},
        lualine_y = { "encoding", "progress" },
        lualine_z = {},
      },
    })
  end,
}
