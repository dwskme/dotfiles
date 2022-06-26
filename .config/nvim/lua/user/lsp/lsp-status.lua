local status_ok, lspstatus = pcall(require, "lsp-status")
if not status_ok then
  return
end


lspstatus.status()
lspstatus.register_progress()
lspstatus.config({
    indicator_errors = '✗',
    indicator_warnings = '⚠',
    indicator_info = '',
    indicator_hint = '',
    indicator_ok = '✔',
    current_function = true,
    diagnostics = false,
    select_symbol = nil,
    update_interval = 100,
    status_symbol = ' 🇻',
})
