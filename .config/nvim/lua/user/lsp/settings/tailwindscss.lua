local M = {}
-- Settings
local filetypes = { "html", "mdx", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" }

local init_options = {
  userLanguages = {
    eelixir = "html-eex",
    eruby = "erb"
  }
}

local settings = {
  tailwindCSS = {
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
    experimental = {
      classRegex = {
        "tw`([^`]*)",
        "tw=\"([^\"]*)",
        "tw={\"([^\"}]*)",
        "tw\\.\\w+`([^`]*)",
        "tw\\(.*?\\)`([^`]*)"
      }
    },
    validate = true
  }
}

M.filetypes = filetypes;
M.settings = settings;
M.init_options = init_options;

return M;
