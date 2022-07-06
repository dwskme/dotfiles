local _M = {}

_M.powerline = {
    circle = {
        left = "",
        right = "",
    },
    arrow = {
        left = "",
        right = "",
    },
    triangle = {
        left = "",
        right = "",
    },
    none = {
        left = "",
        right = "",
    },
}

_M.signs = { Error = "", Warn = "", Hint = "", Info = "" }

_M.set_indent_sizes = function(filetypes)
    for filetype, size in pairs(filetypes) do
        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetype,
            callback = function()
                vim.opt.shiftwidth = size
                vim.opt.tabstop = size
                vim.opt.softtabstop = size
            end,
        })
    end
end

_M.packer_lazy_load = function(plugin, timer)
    -- if plugin then
    --     timer = timer or 0
    --     vim.defer_fn(function()
    --         require("packer").loader(plugin)
    --     end, timer)
    -- end
end
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


_M.remove_whitespaces = function(string)
    return string:gsub("%s+", "")
end

_M.add_whitespaces = function(number)
    return string.rep(" ", number)
end

return _M
