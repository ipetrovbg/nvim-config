local M = {}

function M.get(name)
  local variant = name:match("^kanso%-(.+)$")
  if not variant then
    return name
  end

  local variants = { zen = true, ink = true, mist = true, pearl = true }
  assert(variants[variant], "Unknown Kansō variant: " .. variant)

  local colors = require("kanso.colors").setup({ theme = variant }).theme
  local ui, syn, diag = colors.ui, colors.syn, colors.diag

  return {
    normal = {
      a = { fg = ui.bg, bg = syn.fun, gui = "bold" },
      b = { fg = syn.fun, bg = ui.bg_search },
      c = { fg = ui.fg, bg = ui.bg },
    },
    insert = { a = { fg = ui.bg, bg = diag.ok, gui = "bold" } },
    visual = { a = { fg = ui.bg, bg = syn.keyword, gui = "bold" } },
    replace = { a = { fg = ui.bg, bg = diag.error, gui = "bold" } },
    command = { a = { fg = ui.bg, bg = syn.constant, gui = "bold" } },
    inactive = {
      a = { fg = ui.fg_dim, bg = ui.bg },
      b = { fg = ui.fg_dim, bg = ui.bg },
      c = { fg = ui.fg_dim, bg = ui.bg },
    },
  }
end

return M
