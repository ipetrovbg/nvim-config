return {
  lazy = true,
  cmd = "CodeSnapPreviewOn",
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup({
      watermark = "ipetrovbg",
    })
  end,
}
