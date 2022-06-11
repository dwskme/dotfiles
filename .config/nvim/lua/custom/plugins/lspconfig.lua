local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   capabilities.offsetEncoding = { "utf-16" }
   table.insert(require("lspconfig.server_configurations.clangd").default_config.filetypes, "cuda")
   local servers = { "html", "cssls", "bashls", "emmet_ls", "tsserver", "clangd","jsonls",
   "eslint",
   "tailwindcss",
   "svelte" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
