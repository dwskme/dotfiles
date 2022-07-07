-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --


-- UI

keymap("n", "<leader>fe", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>o", ":SymbolsOutline<CR>", opts)
keymap("n", "<leader>O", ":Vista!!<CR>", opts)
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
keymap("n", "<leader>P", ":Telescope projects<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<S-x>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal Settings
keymap("t","<esc>","<C-\\><C-n>",opts) -- Terminal normal mode
keymap("t","jk","<C-\\><C-n>",opts) -- Terminal normal mode
keymap("t","<C-h>","<c-\\><c-n><c-w>h",opts) -- Terminal window navigation
keymap("t","<C-j>","<c-\\><c-n><c-w>j",opts)
keymap("t","<C-k>","<c-\\><c-n><c-w>k",opts)
keymap("t","<C-l>","<c-\\><c-n><c-w>l",opts)


-- Plugins --

-- Renamer
keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', opts)
keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', opts)

--Toggle Terminal

keymap("n", "<leader>xn", "<cmd>lua _NODE_TOGGLE()<CR>", opts)
keymap("n", "<leader>xc", "<cmd>lua _NCDU_TOGGLE_TOGGLE()<CR>", opts)
keymap("n", "<leader>xh", "<cmd>lua _HTOP_TOGGLE()<CR>", opts)
keymap("n", "<leader>xp", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)
keymap("n", "<leader>xr", "<cmd>lua _RANGER_TOGGLE()<CR>", opts)
keymap("n", "<leader>xt", ":ToggleTerm<CR>", opts)





-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

--Trouble
-- keymap("n", "<leader>tD", "<cmd>Trouble document_diagnostics<cr>", opts)
-- keymap("n", "<leader>td", "<cmd>Trouble lsp_definitions<cr>", opts)
-- keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>", opts)
-- keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", opts)
-- keymap("n", "<leader>tr", "<cmd>Trouble lsp_references<cr>", opts)
-- keymap("n", "<leader>tt", "<cmd>TodoLocList<cr>", opts)
-- keymap("n", "<leader>tW", "<cmd>Trouble workspace_diagnostics<cr>", opts)


-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<leader>ds", "<cmd>lua require'dap.ui.variables'.scopes()<cr>",opts)
keymap("n", "<leader>dh", "<cmd>lua require'dap.ui.variables'.hover()<cr>",opts)
