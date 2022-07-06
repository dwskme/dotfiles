local exec = vim.api.nvim_exec
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local group = augroup("on_bufenter", { clear = true })
local highlight_group = augroup("YankHighlight", { clear = true })


autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

autocmd("BufRead,BufNewFile", {
    pattern = "tsconfig*.json",
    callback = function()
        vim.opt.filetype = "jsonc"
    end,
})

autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
})

-- Use 'q' to quit from common plugins
autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})


-- Set line number for help files.
local help_config = vim.api.nvim_create_augroup("help_config", { clear = true })
autocmd("FileType", {
  pattern = "help",
  callback = function()
    opt.number = true
  end,
  group = help_config,
})

-- Trim Whitespace
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    exec(
      [[
        function! NoWhitespace()
          let l:save = winsaveview()
          keeppatterns %s/\s\+$//e
          call winrestview(l:save)
        endfunction
        call NoWhitespace()
        ]],
      true
    )
  end,
})

-- Auto open nvim-tree when writing (nvim .) in command line
-- and auto open Alpha when nothing given as argument.

if vim.fn.index(vim.fn.argv(), ".") >= 0 then
  autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("NvimTreeOpen")
    end,
  })
  vim.cmd("bd1")
elseif vim.fn.len(vim.fn.argv()) == 0 then
  autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("Alpha")
        vim.cmd("bd 1")
    end,
  })
end

group = augroup("update_statuline", { clear = true })
autocmd("User", {
    command = [[redrawstatus]],
    desc = "Update lualine on lsp progress.",
    group = group,
    pattern = "LspProgressUpdate",
})

group = augroup("clean_onsave", { clear = true })
autocmd("BufWritePre", {
    callback = function()
        perform_cleanup()
    end,
    desc = "Remove trailing whitespace and newlines on save.",
    group = group,
    pattern = "*",
})

group = augroup("update_file", { clear = true })
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
        local regex = vim.regex([[\(c\|r.?\|!\|t\)]])
        local mode = vim.api.nvim_get_mode()["mode"]
        if (not regex:match_str(mode)) and vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
    desc = "If the file is changed outside of neovim, reload it automatically.",
    group = group,
    pattern = "*",
})
autocmd("FileChangedShellPost", {
    callback = function()
        vim_notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN)
    end,
    desc = "If the file is changed outside of neovim, reload it automatically.",
    group = group,
    pattern = "*",
})



