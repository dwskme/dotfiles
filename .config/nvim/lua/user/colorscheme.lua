local _M = {}

local colors = {
    nord = {
        bg = "#2e3440",
        fg = "#ECEFF4",
        red = "#bf616a",
        orange = "#d08770",
        yellow = "#ebcb8b",
        blue = "#5e81ac",
        green = "#a3be8c",
        cyan = "#88c0d0",
        magenta = "#b48ead",

        bg0 = "#949fb5",
        bg1 = "#4C566A",
        bg2 = "#434C5E",
        bg3 = "#3B4252",
        bg4 = "#242932",
        bg5 = "#1e222a",
        bg6 = "#1c1f26",
    },
    github_light = {
        bg = "#ffffff",
        fg = "#24292f",
        red = "#cb2431",
        orange = "#d08770",
        yellow = "#b08800",
        blue = "#005cc5",
        green = "#22863a",
        cyan = "#3192aa",
        magenta = "#5a32a3",

        bg0 = "#24292f",
        bg1 = "#F8F8F8",
        bg2 = "#F4F4F4",
        bg3 = "#EEEEEE",
        bg4 = "#f6f8fa",
        bg5 = "#DFDFDF",
        bg6 = "#D8D8D8",
    },
    github_dark = {
        bg = "#24292e",
        fg = "#d1d5da",
        red = "#f97583",
        orange = "#d08770",
        yellow = "#ffea7f",
        blue = "#79b8ff",
        green = "#85e89d",
        cyan = "#56d4dd",
        magenta = "#b392f0",

        bg0 = "#949fb5",
        bg1 = "#384047",
        bg2 = "#2d3339",
        bg3 = "#22262b",
        bg4 = "#1f2428",
        bg5 = "#0b0d0e",
        bg6 = "#1c1f26",
    },
    github_darker = {
        bg = "#0d1117",
        fg = "#b3b1ad",
        red = "#f97583",
        orange = "#d08770",
        yellow = "#ffea7f",
        blue = "#79b8ff",
        green = "#85e89d",
        cyan = "#56d4dd",
        magenta = "#b392f0",

        bg0 = "#949fb5",
        bg1 = "#384047",
        bg2 = "#2d3339",
        bg3 = "#22262b",
        bg4 = "#010409",
        bg5 = "#0b0d0e",
        bg6 = "#1c1f26",
    },
    gruvbox_light = {
        bg = "#f2e5bc",
        fg = "#282828",
        red = "#cc241d",
        orange = "#d65d0e",
        yellow = "#d79921",
        blue = "#458588",
        green = "#98971a",
        cyan = "#689d6a",
        magenta = "#b16286",

        bg0 = "#928374",
        bg1 = "#a89984",
        bg2 = "#bdae93",
        bg3 = "#d5c4a1",
        bg4 = "#ebdbb2",
        bg5 = "#fbf1c7",
        bg6 = "#f9f5d7",
    },
    gruvbox_dark = {
        bg = "#1d2021",
        fg = "#fbf1c7",
        red = "#cc241d",
        orange = "#d65d0e",
        yellow = "#d79921",
        blue = "#458588",
        green = "#98971a",
        cyan = "#689d6a",
        magenta = "#b16286",

        bg0 = "#928374",
        bg1 = "#333333",
        bg2 = "#282828",
        bg3 = "#262626",
        bg4 = "#1a1a1a",
        bg5 = "#0d0d0d",
        bg6 = "#191b1c",
    },
}

_M.colors = colors.nord

local function custom_highlights()
    return {
        VertSplit = { fg = _M.colors.bg5 },
        BufferLineIndicatorSelected = { fg = _M.colors.cyan, bg = _M.colors.bg },
        BufferLineFill = { fg = _M.colors.fg, bg = _M.colors.bg4 },
        NvimTreeNormal = { fg = _M.colors.fg, bg = _M.colors.bg4 },
        WhichKeyFloat = { bg = _M.colors.bg4 },
        GitSignsAdd = { fg = _M.colors.green },
        GitSignsChange = { fg = _M.colors.orange },
        GitSignsDelete = { fg = _M.colors.red },
        NvimTreeFolderIcon = { fg = _M.colors.bg0 },
        NvimTreeIndentMarker = { fg = _M.colors.bg1 },

        NormalFloat = { bg = _M.colors.bg4 },
        FloatBorder = { bg = _M.colors.bg4, fg = _M.colors.bg4 },

        TelescopeSelection = { bg = _M.colors.bg4 },

        TelescopePromptPrefix = { bg = _M.colors.bg4 },
        TelescopePromptNormal = { bg = _M.colors.bg4 },
        TelescopeResultsNormal = { bg = _M.colors.bg5 },
        TelescopePreviewNormal = { bg = _M.colors.bg6 },

        TelescopePromptBorder = { bg = _M.colors.bg4, fg = _M.colors.bg4 },
        TelescopeResultsBorder = { bg = _M.colors.bg5, fg = _M.colors.bg5 },
        TelescopePreviewBorder = { bg = _M.colors.bg6, fg = _M.colors.bg6 },

        TelescopePromptTitle = { fg = _M.colors.bg4, bg = _M.colors.bg4 },
        TelescopeResultsTitle = { fg = _M.colors.bg5, bg = _M.colors.bg5 },
        TelescopePreviewTitle = { fg = _M.colors.bg6, bg = _M.colors.bg6 },

        Pmenu = { bg = _M.colors.bg4 },
        PMenuThumb = { bg = _M.colors.bg6 },

        LspFloatWinNormal = { fg = _M.colors.fg, bg = _M.colors.bg },
        LspFloatWinBorder = { fg = _M.colors.bg },

        IndentBlanklineChar = { fg = _M.colors.bg1 },
        IndentBlanklineContextChar = { fg = _M.colors.bg0 },
        CursorLine = { bg = _M.colors.bg3 },

        DiagnosticSignError = { fg = _M.colors.red },
        DiagnosticSignWarn = { fg = _M.colors.yellow },
        DiagnosticSignHint = { fg = _M.colors.cyan },
        DiagnosticSignInfo = { fg = _M.colors.magenta },

        DiagnosticError = { fg = _M.colors.red },
        DiagnosticWarn = { fg = _M.colors.yellow },
        DiagnosticHint = { fg = _M.colors.cyan },
        DiagnosticInfo = { fg = _M.colors.magenta },
    }
end

local function polyfill_custom_highlights()
    local customs = custom_highlights()
    for group, conf in pairs(customs) do
        vim.api.nvim_set_hl(0, group, conf)
    end
end

_M.init = function(theme)
    if theme and colors[theme] then
        _M.colors = colors[theme]
    end

    if theme == "gruvbox_light" then
        vim.opt.background = "light"
        vim.g.gruvbox_contrast_light = "soft"
        vim.cmd [[colorscheme gruvbox]]
        polyfill_custom_highlights()
    elseif theme == "gruvbox_dark" then
        vim.opt.background = "dark"
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd [[colorscheme gruvbox]]
        polyfill_custom_highlights()
    elseif theme == "github_dark" then
        local _github, github = pcall(require, "github-theme")

        if not _github then
            return
        end

        github.setup {
            theme_style = "dark",
            dev = true,
            function_style = "italic",
            overrides = custom_highlights,
        }
    elseif theme == "github_light" then
        local _github, github = pcall(require, "github-theme")

        if not _github then
            return
        end

        github.setup {
            theme_style = "light",
            dev = true,
            function_style = "italic",
            overrides = custom_highlights,
        }
    elseif theme == "github_darker" then
        local _github, github = pcall(require, "github-theme")

        if not _github then
            return
        end

        github.setup {
            theme_style = "dark_default",
            dev = true,
            function_style = "italic",
            overrides = custom_highlights,
        }
    else
        local _onenord, onenord = pcall(require, "onenord")

        if not _onenord then
            return
        end

        onenord.setup {
            borders = true,
            fade_nc = false,
            styles = {
                comments = "italic",
                strings = "NONE",
                keywords = "NONE",
                functions = "italic",
                variables = "bold",
                diagnostics = "underline",
            },
            disable = {
                background = false,
                cursorline = false,
                eob_lines = true,
            },
            custom_highlights = custom_highlights(),
        }
    end
end

return _M
