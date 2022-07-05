local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
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
  highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { "python", "css" } },
})


