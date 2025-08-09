return {
  dir = vim.fn.stdpath("config") .. "/lua/plugins/gh-notifications",
  name = "gh_notifications",
  config = function()
    require("plugins.gh-notifications").setup()
  end,
}
