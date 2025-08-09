return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip/loaders/from_vscode").lazy_load()

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- keybindings
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" },  -- snippets
        { name = "copilot" },  -- copilot autocompletion
        { name = "buffer" },   -- text within current buffer
        { name = "path" },     -- file system paths
        -- {
        --   name = "dotenv",
        --   option = {
        --     path = '~/.config/nvim/.env',
        --   }
        -- }
      }),
      formatting = {
        expandable_indicator = true,
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
        experimental = {
          ghost_text = true,
        },
      },
    })
  end,
  -- configure lspkind for vs-code like icons
  dependencies = {
    "onsails/lspkind.nvim",
    {

      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
  },
}
