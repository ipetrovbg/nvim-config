return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-treesitter/playground'
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function ()
    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "incslt", -- Shift|Cmd + UpArrow. Not supposed to type it. Using wezterm for it.
          node_incremental = "incslt",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = { "rust", "lua", "vim", "query", "typescript" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      -- List of parsers to ignore installing (for "all")
      ignore_install = { "" },
      indent = { enabled = true },
      highlight = { enabled = true },
      additional_vim_regex_highlighting = true,
      playground = {
        enable = true,
        disable = { "" },
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        -- keybindings = {
        --   toggle_hl_groups = '|',
        --   show_help = '<Space>',
        -- },
      },
      -- query_linter = {
      -- enable = true,
      -- use_virtual_text = true,
      -- lint_events = {"BufWrite", "CursorHold"},
      -- },
    })
  end
}
