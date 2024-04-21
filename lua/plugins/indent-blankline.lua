local highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = { highlight = highlight, char = "│" },
  },
}
