local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local utils = require "user.utils"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local opts = { noremap = true, silent = true, nowait = true }
local keymap = vim.api.nvim_buf_set_keymap
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview


local servers = {
    "bashls",
    "sumneko_lua",
    "cssls",
    "html",
    "emmet_ls",
    "jsonls",
    "yamlls",
    "dockerls",
    "sumneko_lua",
    "tsserver",
    "gopls",
    "rust_analyzer",
    "eslint",
    "cssmodules_ls",
    "null_ls",
}
lsp_installer.setup({
	ensure_installed = servers,
	ui = {
		border = "rounded",
	},
})

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or { { " ", "FloatBorder" } }
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


local on_attach = function(client, bufnr)
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
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
    vim.keymap.set("n","<leader>ll", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    keymap(bufnr, "n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

    keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    keymap(bufnr, "n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting{async=true}' ]])

    if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.formatting { bufnr = bufnr }
            end,
        })
    end
end





if _cmp_nvim_lsp then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

local _lspconfig = pcall(require, "lspconfig")
if _lspconfig then
    capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
    },
}
    for _, server in ipairs(servers) do
        require("user.lsp.servers." .. server).setup(on_attach, capabilities)
    end
end



-- Diagnostic
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for type, icon in pairs(utils.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


-- for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
-- end

vim.diagnostic.config {
    virtual_text = {
        source = "always",
        prefix = "ﱣ ",
        spacing = 6,
    },
    signs = {
        active = signs, -- show signs
    },
    update_in_insert = false,
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
