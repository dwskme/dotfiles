local _bufferline, bufferline = pcall(require, "bufferline")

if not _bufferline then
    return
end

local colors = require("user.colorscheme").colors

bufferline.setup {
    options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = " ",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf)
            if buf.name:match "%.md" then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 24,
        diagnostics = false,
        offsets = { { filetype = "NvimTree", text = "" ,padding = 1 } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { "", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "insert_at_end",
    },
    highlights = {
        fill = {
            guifg = colors.fg,
            guibg = colors.bg6,
        },
        background = {
            guifg = colors.fg,
            guibg = colors.bg6,
        },
        buffer_visible = {
            guifg = colors.fg,
            guibg = colors.bg6,
        },
        buffer_selected = {
            gui = "bold",
            guifg = colors.fg,
            guibg = colors.bg,
        },
        separator = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        separator_selected = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        separator_visible = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        close_button = {
            guifg = colors.fg,
            guibg = colors.bg6,
        },
        duplicate = {
            guifg = colors.bg1,
            guibg = colors.bg6,
        },
        duplicate_selected = {
            guifg = colors.bg1,
            gui = "italic",
            guibg = colors.bg,
        },
        duplicate_visible = {
            guifg = colors.bg1,
            gui = "italic",
            guibg = colors.bg6,
        },
        indicator_selected = {
            guifg = colors.cyan,
            guibg = colors.bg,
        },
        modified = {
            guifg = colors.bg1,
            guibg = colors.bg6,
        },
        modified_visible = {
            guifg = colors.bg1,
            guibg = colors.bg6,
        },
        modified_selected = {
            guifg = colors.bg1,
            guibg = colors.bg,
        },
    },
    
--   highlights = {
--     fill = {
--       guifg = { attribute = "fg", highlight = "#ff0000" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },
--     background = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },

--     buffer_visible = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },

--     close_button = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },
--     close_button_visible = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },

--     tab_selected = {
--       guifg = { attribute = "fg", highlight = "Normal" },
--       guibg = { attribute = "bg", highlight = "Normal" },
--     },
--     tab = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },
--     tab_close = {
--       guifg = { attribute = "fg", highlight = "TabLineSel" },
--       guibg = { attribute = "bg", highlight = "Normal" },
--     },

--     duplicate_selected = {
--       guifg = { attribute = "fg", highlight = "TabLineSel" },
--       guibg = { attribute = "bg", highlight = "TabLineSel" },
--       gui = "italic",
--     },
--     duplicate_visible = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--       gui = "italic",
--     },
--     duplicate = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--       gui = "italic",
--     },

--     modified = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },
--     modified_selected = {
--       guifg = { attribute = "fg", highlight = "Normal" },
--       guibg = { attribute = "bg", highlight = "Normal" },
--     },
--     modified_visible = {
--       guifg = { attribute = "fg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },

--     separator = {
--       guifg = { attribute = "bg", highlight = "TabLine" },
--       guibg = { attribute = "bg", highlight = "TabLine" },
--     },
--     separator_selected = {
--       guifg = { attribute = "bg", highlight = "Normal" },
--       guibg = { attribute = "bg", highlight = "Normal" },
--     },
--     indicator_selected = {
--       guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
--       guibg = { attribute = "bg", highlight = "Normal" },
--     },
--   },


}
