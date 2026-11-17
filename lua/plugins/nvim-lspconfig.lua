local merge = require("util.keymapper").table_merge
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
    merge(opts, { desc = "Go to Definition" }))
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>",
    merge(opts, { desc = "Hover Documentation" }))
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

  -- Option + m
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-m>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>",
    merge(opts, { desc = "Open Diagnostic" }))
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])
end

local on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.document_formatting = true
  end
  if client.name == "eslint" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local config = function()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  -- for type, icon in pairs(diagnostic_signs) do
  --	local hl = "DiagnosticSign" .. type
  --	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  -- end
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- lua
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })

  -- json
  vim.lsp.config("jsonls", {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
    cmd = { "vscode-json-language-server", "--stdio" },
    init_options = {
      provideFormatter = true,
    },
  })

  -- Typescript additional settins
  vim.lsp.config("ts_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "javascript.jsx",
      "typescript.tsx",
    },
    root_dir = function(bufnr, on_dir)
      on_dir(vim.fs.root(bufnr, { ".git", "package.json", "tsconfig.json" }))
    end,
    cmd = { "typescript-language-server", "--stdio" },
    init_options = {
      hostInfo = "neovim",
    },
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  })

  -- yaml
  vim.lsp.config("yamlls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.yml",
          ["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = {
            "resources/**.yml",
          },
        },
      },
    },
  })

  -- Grpaql additional settins
  vim.lsp.config("graphql", {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "graphql", "typescriptreact", "javascriptreact" },
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    settings = {
      graphql = {
        ["graphql-config.load.legacy"] = true,
      },
    },
  })

  -- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
  vim.lsp.config("emmet_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "javascript",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "vue",
    },
  })

  vim.lsp.config("eslint", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  -- Elm
  vim.lsp.config("elmls", {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      elmAnalyseTrigger = "change",
      elmFormatPath = "elm-format",
    },
  })

  -- Rust
  vim.lsp.config("rust_analyzer", {
    root_dir = function(bufnr, on_dir)
      on_dir(vim.fs.root(bufnr, { ".git" }))
    end,
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        memoryUsage = true,
        syntaxTree = true,
        analyzerStatus = true,
        reloadWorkspace = true,
        run = true,
        cargo = {
          features = "all", -- Enable all features
        },
        procMacro = {
          enable = true,
          ignored = {
            leptos_macro = {
              -- optional: --
              -- "component",
              "server",
            },
          },
        },
        inlayHints = {
          bindingModeHints = {
            enable = true,
          },
          chainingHints = {
            enable = false,
          },
          closingBraceHints = {
            enable = false,
          },
          closureReturnTypeHints = {
            enable = false,
          },
          parameterHints = {
            enable = false,
          },
          typeHints = {
            enable = false,
          },
          renderColons = false,
        },
        diagnostics = {
          disabled = { "inactive-code", "unresolved-proc-macro" }
        },
      },
    },
  })

  vim.lsp.enable({
    "lua_ls",
    "jsonls",
    "ts_ls",
    "yamlls",
    "graphql",
    "emmet_ls",
    "eslint",
    "elmls",
    "rust_analyzer",
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = true,
  event = { "BufReadPre", "BufNewFile", "BufRead" },
  dependencies = {
    "windwp/nvim-autopairs",
    -- "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
