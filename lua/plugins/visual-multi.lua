return {
  "mg979/vim-visual-multi",
  branch = "master",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end
}
