local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end
local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "graphql",
  "eslint",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "tailwindcss",
  "vuels"
}
lsp_installer.setup {
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = servers,

  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
  }
}
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "eslint" then
    local eslint_opts= require "user.lsp.settings.eslint"
    -- opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  end

  if server == "jsonls" then
    local jsonls_opts = require "user.lsp.settings.jsonls"
    -- opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require "user.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "tailwindcss" then
    local tailwindcss_opts = require "user.lsp.settings.tailwindscss"
    local filetypes = require('user.lsp.settings.tailwindscss').filetypes
    local init_options = require('user.lsp.settings.tailwindscss').init_options
    -- opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts, filetypes, init_options)
  end

  if server == "vuels" then
    local vuels_opts= require "user.lsp.settings.vuels"
    local filetypes = require('user.lsp.settings.vuels').filetypes
    local init_options = require('user.lsp.settings.vuels').init_options
    opts = vim.tbl_deep_extend("force", vuels_opts, opts, filetypes, init_options)
  end

  lspconfig[server].setup(opts)
end
