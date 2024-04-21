local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
-- local previewers = require("telescope.previewers")
-- local utils = require("telescope.previewers.utils")
local config = require("telescope.config").values
local M = {}

M.show = function(opts)
  pickers.new(opts, {
    prompt_title = "Collected Intels",
    finder = finders.new_async_job({
      command_generator = function()
        return { "intelrs" }
      end,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry,
          ordinal = entry,
        }
      end,
    }),
    sorter = config.generic_sorter(opts),
    -- previewer    = previewers.new_buffer_previewer({
    --   title = "Intel",
    --   define_preview = function(self, entry)
    --     vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, true,
    --       vim.tbl_flatten({
    --         -- "```lua",
    --         vim.split(
    --           vim.inspect(entry.value),
    --           "\n"
    --         ),
    --         -- "```"
    --       }))
    --     utils.highlighter(self.state.bufnr, "markdown")
    --   end,
    -- })
  }):find()
end

return M
