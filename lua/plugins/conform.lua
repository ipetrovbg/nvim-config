return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      graphql = { "prettier" },
      markdown = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      toml = { "yamlfmt" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  },
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ async = true, lsp_fallback = true, timeout_ms = 500 })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  event = { "BufReadPre", "BufWritePre", "BufNewFile" },
  cmd = { "ConformInfo" },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
