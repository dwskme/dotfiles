local M = {}

M.init = function(theme)
  if not theme then
    theme = require("user.core.utils").load_config().ui.theme
  end
  local present, base16 = pcall(require, "base16")
  if present then
    base16(base16.themes(theme), true)
    package.loaded["user.colors.highlights" or false] = nil
    require("user.colors.highlights")
  end
end

M.get = function()
  local theme = "uwu" 
  return require("user.colors.hl_themes." .. theme)
end

return M
