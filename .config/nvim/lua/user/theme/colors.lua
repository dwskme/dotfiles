local config = "nightfox"
local colors = {}
local mod = 'user.theme.integrated.'
local supported_themes = require('.theme.plugins').supported_themes

for _, theme in pairs(supported_themes) do
  if theme == config then
    colors = require(mod .. theme)
  end
end

if vim.tbl_isempty(colors) then
  return false
end

return colors
