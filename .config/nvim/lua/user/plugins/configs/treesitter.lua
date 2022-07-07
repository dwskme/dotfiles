local _treesitter, treesitter = pcall(require, "nvim-treesitter.configs")

if not _treesitter then
    return
end

local colors = require("user.colorscheme").colors

treesitter.setup {
    autotag = {
        enable = true,
        filetypes = {
			"html" , "xml",
			'html',
			'javascript', 'javascriptreact', 'jsx',
			'typescript', 'typescriptreact', 'tsx',
			'rescript',
			'svelte',
			'vue',
			'php',
			'markdown',
			'glimmer','handlebars','hbs'
		},
    },
    ensure_installed = "all",
    highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { "python", "css" } },
    rainbow = {
        colors = {
            colors.magenta,
            colors.cyan,
            colors.yellow,
            colors.orange,
            colors.red,
            colors.blue,
            colors.green,
        },
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
			typescript = "// %s",
			css = "/* %s */",
			scss = "/* %s */",
			html = "<!-- %s -->",
			svelte = "<!-- %s -->",
			vue = "<!-- %s -->",
			json = "",
		},
    },
}
