local key_map = vim.api.nvim_set_keymap
-- TELESCOPE keymaps 🔭 --

-- LSP!
-- show LSP implementations
key_map(
  "n",
  "<leader>ti",
  [[<Cmd>lua require'telescope.builtin'.lsp_implementations()<CR>]],
  { noremap = true, silent = true }
)

-- show LSP definitions
key_map(
  "n",
  "<leader>td",
  [[<Cmd>lua require'telescope.builtin'.lsp_definitions({layout_config = { preview_width = 0.50, width = 0.92 }, path_display = { "shorten" }, results_title='Definitions'})<CR>]],
  { noremap = true, silent = true }
)
-- show DOCUMENT Symbols
key_map(
  "n",
  ",ws",
  [[<Cmd>lua require'telescope.builtin'.lsp_document_symbols()<CR>]],
  { noremap = true, silent = true }
)

-- git telescope goodness
-- git_branches
key_map(
  "n",
  "<space>gb",
  [[<Cmd>lua require'telescope.builtin'.git_branches({prompt_title = ' ', results_title='Git Branches'})<CR>]],
  {
    noremap = true,
    silent = true,
  }
)
-- git_bcommits - file scoped commits with diff preview. <C-V> for vsp diff to parent
key_map(
  "n",
  "<space>gc",
  [[<Cmd>lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'})<CR>]],
  { noremap = true, silent = true }
)
-- git_commits (log) git log
key_map("n", "gl", [[<Cmd>lua require'telescope.builtin'.git_commits()<CR>]], { noremap = true, silent = true })
-- git_status - <tab> to toggle staging
key_map("n", "gs", [[<Cmd>lua require'telescope.builtin'.git_status()<CR>]], { noremap = true, silent = true })

-- show Workspace Diagnostics
key_map("n", ",d", [[<Cmd>lua require'telescope.builtin'.diagnostics()<CR>]], { noremap = true, silent = true })

-- open available commands & run it
key_map(
  "n",
  ",c",
  [[<Cmd>lua require'telescope.builtin'.commands({results_title='Commands Results'})<CR>]],
  { noremap = true, silent = true }
)

-- Telescope oldfiles
key_map(
  "n",
  ",o",
  [[<Cmd>lua require'telescope.builtin'.oldfiles({prompt_title=':oldfiles', results_title='Old Files'})<CR>]],
  { noremap = true, silent = true }
)


key_map(
  "n",
  ",m",
  [[<Cmd>lua require'telescope.builtin'.marks({results_title='Marks Results'})<CR>]],
  { noremap = true, silent = true }
)


-- browse, explore and create notes
key_map("n", ",n", [[<Cmd>lua require'user.plugins.configs.telescope'.browse_notes()<CR>]], { noremap = true, silent = true })
-- Explore files starting at $HOME
key_map("n", ",e", [[<Cmd>lua require'user.plugins.configs.telescope'.file_explorer()<CR>]], { noremap = true, silent = true })




-- find notes
key_map("n", "<leader>n", [[<Cmd>lua require'user.plugins.configs.telescope'.find_notes()<CR>]], { noremap = true, silent = true })
-- search notes
key_map("n", "<space>n", [[<Cmd>lua require'user.plugins.configs.telescope'.grep_notes()<CR>]], { noremap = true, silent = true })
-- Find files in config dirs
key_map("n", "<space>e", [[<Cmd>lua require'user.plugins.configs.telescope'.find_configs()<CR>]], { noremap = true, silent = true })
-- greg for a string
key_map("n", "<space>g", [[<Cmd>lua require'user.plugins.configs.telescope'.grep_prompt()<CR>]], { noremap = true, silent = true })
-- find or create neovim configs
key_map("n", "<leader>nc", [[<Cmd>lua require'user.plugins.configs.telescope'.nvim_config()<CR>]], { noremap = true, silent = true })

-- Github issues
key_map("n", "<leader>is", [[<Cmd>lua require'user.plugins.configs.telescope'.gh_issues()<CR>]], { noremap = true, silent = true })
-- github Pull Requests - PRs
key_map("n", "<leader>pr", [[<Cmd>lua require'user.plugins.configs.telescope'.gh_prs()<CR>]], { noremap = true, silent = true })

-- neoclip
key_map(
  "n",
  "<C-n>",
  [[<Cmd>lua require('telescope').extensions.neoclip.default()<CR>]],
  { noremap = true, silent = true }
)

-- grep the Neovim source code with word under cursor → cword - just z to Neovim source for other actions
key_map("n", "<leader>ns", [[<Cmd>lua require'user.plugins.configs.telescope'.grep_nvim_src()<CR>]], { noremap = true, silent = true })
-- End Telescope maps
