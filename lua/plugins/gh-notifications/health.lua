local M = {}

M.check = function()
  vim.health.start("GitHub Notifications report")

  -- Check if curl is available
  if vim.fn.executable("gh") == 0 then
    vim.health.error("gh CLI not found on path")
    return
  end

  -- Indicate that we found gh, which is good!
  vim.health.ok("gh found on path")
end

return M
