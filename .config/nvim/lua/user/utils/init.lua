local M = {}
local fn = vim.fn

--- Trim newline at eof, trailing whitespace.
function _G.perform_cleanup()
    local patterns = {
        -- remove leading empty lines
        [[%s/\%^\n//e]],
        -- remove trailing empty lines
        [[%s/$\n\+\%$//e]],
        -- remove trailing spaces
        [[%s/\s\+$//e]],
        -- remove trailing "\r"
        [[%s/\r\+//e]],
    }

    local view = vim.fn.winsaveview()

    for _, v in pairs(patterns) do
        vim.cmd(string.format("keepjumps keeppatterns silent! %s", v))
    end

    vim.fn.winrestview(view)
end

    --- Redraw before notifying
---@param msg string Content of the notification to show to the user.
---@param level number|nil One of the values from vim.log.levels.
function _G.vim_notify(msg, level)
    vim.cmd("redraw")
    vim.notify(msg, level)
end


M.remove_whitespaces = function(string)
  return string:gsub("%s+", "")
end

M.add_whitespaces = function(number)
  return string.rep(" ", number)
end

return M
