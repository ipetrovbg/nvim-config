-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  pattern = "*",
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ visual = true, timeout = 200 })
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = args.buf,
      desc = "Go to Definition",
    })
  end,
})
