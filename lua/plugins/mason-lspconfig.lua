local opts = {
  ensure_installed = {
    "ts_ls",
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "lua_ls",
    "elmls",
    "rust_analyzer",
    "eslint",
    "jsonls",
    "yamlls",
    "graphql",
  },

  automatic_installation = true,
  max_concurrent_installers = 4,
  -- Fixes an issue where multiple lsp instances would be attached
  -- that causes go to definition to open multiple instances of the same definition
  automatic_enable = false
}

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = opts,
  event = "BufReadPre",
}
