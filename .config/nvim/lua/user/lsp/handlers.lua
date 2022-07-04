local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gx", "<cmd>lua vim.lsp.buf.clear_references()<CR>", opts)
  keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>oo", "<cmd>lua vim.lsp.buf.document_highlight()<cr>", opts)
  keymap(bufnr, "n", "<leader>ou", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)

  -- keymap(bufnr, "n", "<leader>ui", "<cmd>lua vim.lsp.buf.execute_command()<cr>", opts)
  -- keymap(bufnr, "n", "<leader>ju", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)
  -- keymap(bufnr, "n", "<leader>of", "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>", opts)
  -- keymap(bufnr, "n", "<leader>tu", "<cmd>lua vim.lsp.buf.server_ready()<cr>", opts)
  -- keymap(bufnr, "n", "<leader>tt", "<cmd>lua vim.lsp.buf.formatting_sync() <cr>", opts)
  -- keymap(bufnr, "n", "<leader>nn", "<cmd>lua vim.lsp.buf.formatting_seq_sync() <cr>", opts)
  -- keymap(bufnr, "n", "<leader>nh", "<cmd>lua vim.lsp.buf.document_formatting() <cr>", opts)
  -- keymap(bufnr, "n", "<leader>hn", "<cmd>lua vim.lsp.buf.range_formatting() <cr>", opts)
  -- keymap(bufnr, "n", "<leader>nb", "<cmd>lua vim.lsp.buf.range_code_action() <cr>", opts)

  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
  keymap(bufnr, "n", "<leader>lx", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
  keymap(bufnr, "n", "<leader>lw", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
  vim.keymap.set("n", "<leader>ll", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

  keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)

end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end

  if client.name == "sumneko_lua" then
    client.resolved_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
