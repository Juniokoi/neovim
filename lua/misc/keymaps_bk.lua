local l = require("misc")

l.keymap("x", "<leader>p", [["_dP]])
l.keymap({ "n", "v" }, "<leader>y", [["+y]])
l.keymap("n", "<leader>Y", [["+Y]])
l.keymap("n", "<leader>w", ":silent update<CR>")

l.keymap("i", "jk", "<esc>")

l.keymap("n", "<Tab>", "za")
l.keymap("n", "<S-Tab>", "zM")

-- Source current Neovim file
l.keymap("n", ",r", ":silent w | SaveSession | so %<cr>", { noremap = true, silent = true, desc = "Source init.lua" })

l.keymap({ "n" }, "U", require("ts-node-action").node_action, { desc = "Trigger Node Action" })

-- Better window navigation
l.keymap("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
l.keymap("n", "<C-j>", "<C-w>j")
l.keymap("n", "<C-k>", "<C-w>k")
l.keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
l.keymap("n", "<C-A-k>", ":resize +2<CR>")
l.keymap("n", "<C-A-j>", ":resize -2<CR>")
l.keymap("n", "<C-A-h>", ":vertical resize -2<CR>")
l.keymap("n", "<C-A-l>", ":vertical resize +2<CR>")

-- Format paragraph
l.keymap("n", "fp", "mz=ip'zk")
l.keymap("n", "==", "mz=ip`zk")

-- Navigate buffers
l.keymap("n", "<C-c>", "<Esc>")
l.keymap("n", "<S-l>", ":bnext<CR>")
l.keymap("n", "<S-h>", ":bprevious<CR>")
l.keymap("n", "J", "mzJ`z")
l.keymap("n", "n", "nzzzv")
l.keymap("n", "N", "Nzzzv")

-- Visual --
-- Stay in indent mode
l.keymap("v", "<", "<gv")
l.keymap("v", ">", ">gv")

-- Move text up and down
l.keymap({ "v", "n" }, "<A-k>", ":m .-2<CR>==")
l.keymap({ "v", "n" }, "<A-j>", ":m .+1<CR>==")

-- Visual Block --
-- Move text up and down
l.keymap("x", "J", ":move '>+1<CR>gv-gv")
l.keymap("x", "K", ":move '<-2<CR>gv-gv")
l.keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
l.keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Buffer
l.keymap("n", "<leader>q", "<cmd>Bdelete<cr>")
-- Neotree
l.keymap("n", "<leader>e", ":Neotree toggle<cr>")
-- Lspsaga
l.keymap("l", "n", "gh", "Lspsaga lsp_finder", { desc = "Lspsaga: Find Symbol Definition" })
l.keymap("l", "n", "gr", "Lspsaga rename", { desc = "Lspsaga: Rename" })
l.keymap("l", "n", "gR", "Lspsaga rename ++projecj", { desc = "Lspsaga: Rename with project" })
l.keymap("l", "n", "ga", "Lspsaga code_action", { desc = "Lspsaga: Code Action" })
l.keymap("l", "v", "ga", "Lspsaga code_action", { desc = "Lspsaga: Code Action" })
l.keymap("l", "n", "gd", "Lspsaga peek_definition")
l.keymap("l", "n", "gD", "Lspsaga goto_definition")
l.keymap("l", "n", "gs", "lua vim.lsp.buf.signature_help()")
l.keymap("l", "n", "go", "Lspsaga outline")
l.keymap("l", "n", "gE", "Lspsaga diagnostic_jump_prev")
l.keymap("l", "n", "ge", "Lspsaga diagnostic_jump_next")
local severity = vim.diagnostic.severity.ERROR
l.keymap("n", "g]", function() require("lspsaga.diagnostic"):goto_prev({ severity = severity }) end)
l.keymap("n", "g[", function() require("lspsaga.diagnostic"):goto_next({ severity = severity }) end)
l.keymap("l", "n", "K", "Lspsaga hover_doc")
l.keymap("l", "n", "<leader>sl", "Lspsaga show_line_diagnostics")
l.keymap("l", "n", "<leader>sc", "Lspsaga show_cursor_diagnostics")
l.keymap("l", "n", "<leader>sb", "Lspsaga show_buf_diagnostics")
l.keymap("l", "n", "<Leader>ci", "Lspsaga incoming_calls")
l.keymap("l", "n", "<Leader>co", "Lspsaga outgoing_calls")

-- Lazy
l.keymap("n", "<space>po", ":Lazy<cr>")
l.keymap("n", "<space>po", ":Lazy sync<cr>")
l.keymap("n", "<space>po", ":Lazy update<cr>")
l.keymap("n", "<space>po", ":Lazy install<cr>")
l.keymap("n", "<space>po", ":Lazy log<cr>")
l.keymap("n", "<space>po", ":Lazy check<cr>")
l.keymap("n", "<space>po", ":Lazy debug<cr>")
l.keymap("n", "<space>po", ":Lazy profile<cr>")

-- DAP
l.keymap("dap", "n", ",d", "continue()<cr>")
l.keymap("dap", "n", ",p", "step_out()<cr>")
l.keymap("dap", "n", ",rl", "run_last()<cr>")
l.keymap("dap", "n", ",o", "step_over()<cr>")
l.keymap("dap", "n", ",n", "step_into()<cr>")
l.keymap("dap", "n", ",ro", "repl.open()<cr>")
l.keymap("dap", "n", ",rc", "run_to_cursor()<cr>")
l.keymap("dap", "n", ",c", "terminate() require('dapui').close()<cr>")
l.keymap("dap", "n", ",b", "set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")

-- Telescope
l.keymap(
	"n",
	"<leader>/",
	function()
		require("telescope.builtin").current_buffer_fuzzy_find(
			require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
		)
	end,
	{ desc = "[/] Fuzzily search in current buffer]" }
)
l.keymap("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "[F]ind [P]rojects" })
l.keymap("n", "<leader>fe", "<cmd>Telescope frecency<cr>", { desc = "[F]ind fr[E]cency" })
l.keymap("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { desc = "[F]ind Browser" })
l.keymap("n", "<leader>fr", require("telescope.builtin").oldfiles, { desc = " [F]ind [R]ecently opened files" })
l.keymap("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
l.keymap("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
l.keymap("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
l.keymap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
l.keymap("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
l.keymap("n", "<leader>sg", require("telescope.builtin").git_files, { desc = "[S]earch (inside) [G]it_files" })
l.keymap("n", "<leader>sk", require("telescope.builtin").l.keymaps, { desc = "[S]earch [M]appings" })
l.keymap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = " [F]ind existing buffers" })
