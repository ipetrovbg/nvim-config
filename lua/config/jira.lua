local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local config = require("telescope.config").values
local async = require "plenary.async"
local curl = require "plenary.curl"
local keychain = require "util.keychain"
local M = {}

-- This module depends on telescope.nvim and plenary.nvim and tyru/open-browser.vim


M.show = function(opts)
  async.run(function()
    local jira_url = keychain.get_keychain_value("jira", "jira_nvim_url")
    local jira_token = keychain.get_keychain_value("jira", "jira_nvim_token")
    local jira_user = keychain.get_keychain_value("jira", "jira_nvim_user")

    local jira_sprint_body = { jql = "Sprint = \"Sprint Name\"" }
    local jira_brower = jira_url .. "/browse/"

    local response = curl.post(jira_url .. "/rest/api/2/search", {
      accept = "application/json",
      headers = {
        content_type = "application/json",
      },
      auth = jira_user .. ":" .. jira_token,
      body = vim.fn.json_encode(jira_sprint_body),
    })

    if response.status >= 400 then
      vim.notify("Aborting due to Error: " .. response.status, vim.log.levels.ERROR)
      return
    end

    local results = vim.json.decode(response.body)

    pickers.new(opts, {
      prompt_title    = "Jira Issues",
      finder          = finders.new_table {
        results = results.issues,
        entry_maker = function(entry)
          return {
            value = entry,
            display = "[" .. entry.key .. "] " .. entry.fields.summary,
            ordinal = entry.key .. " " .. entry.fields.summary,
          }
        end,
      },
      sorter          = config.generic_sorter(opts),
      previewer       = previewers.new_buffer_previewer({
        title = "Jira Issue",
        define_preview = function(self, entry)
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, false,
            vim.tbl_flatten({ "[" .. entry.value.key .. "]", "Title: " .. entry.value.fields.summary,
              vim.split(
                vim.inspect(entry.value.fields.description),
                "\n"
              ) })

          )
        end,
      }),
      attach_mappings = function()
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          vim.cmd(":OpenBrowser " .. jira_brower .. selection.value.key)
        end)
        return true
      end
    }):find()
  end)
end

return M
