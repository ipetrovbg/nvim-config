-- When you want to change the colorscheme, you need to uncomment..
-- the theme config and also change the colorscheme in the
-- .wezterm.lua, plugins/lualine.lua files and config/init.lua
--
-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     lazy = false,
--     config = function()
--       vim.cmd([[colorscheme gruvbox]])
--     end,
--     opts = {}
--   }
-- }
--   return {
--     {
--       "ellisonleao/gruvbox.nvim",
--       priority = 1000,
--       lazy = false,
--       config = function()
--         vim.cmd([[colorscheme gruvbox]])
--       end,
--       opts = {}
--     }
--   }

--   return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       flavour = "macchiato", -- latte, frappe, macchiato, mocha
--     },
--     config = function()
--       vim.cmd([[colorscheme catppuccin]])
--     end,
--   }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- on_highlights = function(hl)
    -- end,
  },
  config = function()
    vim.cmd([[colorscheme tokyonight-moon]])
  end
}
-- end
