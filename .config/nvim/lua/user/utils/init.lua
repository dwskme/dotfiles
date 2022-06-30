local M = {}
local fn = vim.fn
M.remove_whitespaces = function(string)
  return string:gsub("%s+", "")
end

M.add_whitespaces = function(number)
  return string.rep(" ", number)
end

return M
