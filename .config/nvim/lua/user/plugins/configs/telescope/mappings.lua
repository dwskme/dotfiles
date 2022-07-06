local key_map = vim.api.nvim_set_keymap
opts = { noremap = true, silent = true }

-- find files including gitignored
key_map("n","<space>tf", [[<Cmd>lua require'telescope.builtin'.find_files({find_command={'fd','--no-ignore-vcs'}})<CR>]],opts)

-- Project Search
key_map("n", "<space>tp", [[<Cmd>lua Telescope projects<CR>]], opts)

-- find files with gitfiles & fallback on find_files
key_map("n", "<space>tP", [[<Cmd>lua require'user.plugins.configs.telescope'.project_files()<CR>]], opts)

-- Browse files from cwd - File Browser
key_map("n","<space>te",[[<Cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]],opts)

--Live Grep
key_map("n", "<space>tg",   [[<Cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>]],opts)

-- grep word 
key_map("n", "<leader>tt", [[<Cmd>lua require'telescope.builtin'.grep_string()<CR>]], opts)

-- grep word under cursor - case-sensitive (exact word) - made for use with Replace All - see <leader>ra
key_map("n","<leader>tT",[[<Cmd>lua require'telescope.builtin'.grep_string({word_match='-w'})<CR>]],opts)

--Find Buffers
key_map("n","<space>tb",
    [[<Cmd>lua require'telescope.builtin'.buffers({prompt_title = '', results_title='﬘', winblend = 3, layout_strategy = 'vertical', layout_config = { width = 0.60, height = 0.55 }})<CR>]],
    opts
)
--Colorscheme
key_map("n", "<space>tc", [[<Cmd>Telescope colorscheme<CR>]], opts)

--Help Tags
key_map(  "n","<space>th",[[<Cmd>lua require'telescope.builtin'.help_tags({results_title='Help Results'})<CR>]],opts)

--Keymaps
key_map("n","<space>tK",[[<Cmd>lua require'telescope.builtin'.keymaps({results_title='Key Maps Results'})<CR>]],opts)

--Man Pages
key_map("n","<space>tM",[[<Cmd>Telescope man_pages<CR>]],opts)

-- registers picker
key_map("n", "<space>r", [[<Cmd>lua require'telescope.builtin'.registers()<CR>]], opts)

-- Current buffer serach
key_map("n",",<space>ts",[[<Cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]],opts)

-- telescope-repo-file
key_map("n", "<leader>tG", [[<Cmd>lua require'user.plugins.configs.telescope'.repo_list()<CR>]], opts)

-- open zoxide list
key_map("n","<leader>tz",":lua require'telescope'.extensions.zoxide.list{results_title='Z Directories', prompt_title='Z Prompt'}<CR>",opts)



-- command palette
key_map("n","<space>tk",[[<Cmd>lua require('telescope').extensions.command_palette.command_palette()<CR>]],opts)

-- Search through your Neovim related todos
key_map("n", "<leader>st", ":lua require'user.plugins.configs.telescope'.search_todos()<CR>", opts)

-- search chrome bookmarks & go
key_map("n","<space>tB",[[<Cmd>lua require('telescope').extensions.bookmarks.bookmarks()<CR>]],opts)


-- telescope notify history
key_map("n","<leader>tn",[[<Cmd>lua require('telescope').extensions.notify.notify({results_title='Notification History', prompt_title='Search Messages'})<CR>]],opts)
-- Telescope resume (last picker)
key_map("n", "<leader>tl", [[<Cmd>lua require'telescope.builtin'.resume()<CR>]], opts)
