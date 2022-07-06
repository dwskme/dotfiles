local _impatient, impatient = pcall(require, "impatient")
if _impatient then
    impatient.enable_profile()
end

require "user.core"
require "user.plugins"
require "user.lsp"
-- require "user.mappings"