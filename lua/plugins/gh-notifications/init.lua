local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local config = require("telescope.config").values
local async = require "plenary.async"

local M = {}
---Opens GitHub Notifications in a picker

local function async_request(args, on_read)
  local buffer = ""
  local stdout = vim.loop.new_pipe()
  local stderr = vim.loop.new_pipe()
  local handle = nil

  handle = vim.loop.spawn('gh', {
      args = args,
      stdio = { nil, stdout, stderr },
    },
    function()
      stdout:read_stop()
      stderr:read_stop()
      stdout:close()
      stderr:close()
      handle:close()
    end
  )

  vim.loop.read_start(stdout, function(err, data)
    if err then
      return err, nil
    end
    if data then
      buffer = buffer .. data
    end
    if data == nil then
      data = vim.json.decode(buffer)
      vim.schedule(function() on_read(data) end)
    end
  end)
end

local function filter(tbl, condition)
  local result = {}
  for _, v in ipairs(tbl) do
    if condition(v) then
      table.insert(result, v)
    end
  end
  return result
end

local function show(opts)
  async.run(function()
    local args = {
      'api',
      'notifications',
    }
    async_request(args, function(data)
      local pr = filter(data, function(item)
        return item.subject.type == "PullRequest"
      end)
      pickers.new(opts, {
        prompt_title    = "PRs",
        finder          = finders.new_table {
          results = pr,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry.subject.title,
              ordinal = entry.subject.title,
            }
          end,
        },
        sorter          = config.generic_sorter(opts),
        previewer       = previewers.new_buffer_previewer({
          title = "PR",
          define_preview = function(self, entry)
            vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, false,
              { entry.value.repository.full_name, entry.value.subject.title }
            )
          end,
        }),
        attach_mappings = function()
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            if selection.value.subject.url ~= nil then
              local new_url = selection.value.subject.url:gsub("https://api.github.com/repos/(.-)/(.-)/pulls/(%d+)",
                "https://github.com/%1/%2/pull/%3")

              vim.cmd(":OpenBrowser " .. new_url)
            end
          end)
          return true
        end
      }):find()
    end)
  end)
end

vim.api.nvim_create_user_command("Ghpr", function(opts)
  show(opts)
end, {
  nargs = "*",
  desc = "Check GitHub Notifications",
})


return M
