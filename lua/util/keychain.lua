local M = {}
M.get_keychain_value = function(service, account)
  -- Build the security command
  local cmd = string.format('security find-generic-password -s "%s" -a "%s" -w', service, account)

  -- Execute the command and capture the output
  local result = vim.fn.system(cmd)

  -- Check for errors
  if vim.v.shell_error ~= 0 then
    print("Error retrieving keychain value:", result)
    return nil
  end

  -- Return the value (trimming any trailing newline)
  return result:gsub("%s+$", "")
end

return M
