local status_ok, cmpnpm = pcall(require, "cmp-npm")
if not status_ok then
	return
end

cmpnpm.setup({
  ignore = {},
  only_semantic_versions = true,
})
