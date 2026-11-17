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
--

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     flavour = "latte", -- latte, frappe, macchiato, mocha
--   },
--   config = function(_, opts)
--     vim.opt.background = "light"
--     require("catppuccin").setup(opts)
--     vim.cmd([[colorscheme catppuccin]])
--   end,
-- }
--
return {
  "webhooked/kanso.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanso").setup({
      overrides = function(colors)
        return {
          Cursor = { fg = colors.theme.ui.bg, bg = colors.theme.syn.fun },
        }
      end,
    })
    vim.cmd([[colorscheme kanso-zen]]) -- kanso-zen, kanso-pearl
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     -- on_highlights = function(hl)
--     -- end,
--   },
--   config = function()
--     vim.cmd([[colorscheme tokyonight-moon]])
--   end
-- }
-- end
