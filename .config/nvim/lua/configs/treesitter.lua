local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "fish",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "haskell",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "odin",
        "printf",
        "python",
        "toml",
        "astro",
        "vim",
        "vimdoc",
        "yaml",
        "javascript", -- Add JavaScript
        "typescript", -- Add TypeScript (useful if Astro or Markdown contains TS)
        "tsx",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = { "markdown" }, -- Enable fallback regex for Markdown
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
