local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local util = require'misc'

local keymap = function(mode, lhs, rhs, desc)
    local merged = {}
    if desc then
        util.merge(merged, desc)
    end
    util.merge(merged,opts)
    return vim.keymap.set(mode, lhs, rhs, merged)
end

keymap("x", "<leader>p", [["_dP]])
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])
keymap("n", "<leader>w", ":silent update<CR>")

keymap("i", "jk", "<esc>")

keymap("n", "<Tab>", "za")
keymap("n", "<S-Tab>", "zM")

-- Source current Neovim file
keymap("n", ",r", ":silent w | SaveSession | so %<cr>",
	{ noremap = true, silent = true, desc = "Source init.lua" })

keymap({ "n" }, "U", require("ts-node-action").node_action, { desc = "Trigger Node Action" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-A-k>", ":resize +2<CR>")
keymap("n", "<C-A-j>", ":resize -2<CR>")
keymap("n", "<C-A-h>", ":vertical resize -2<CR>")
keymap("n", "<C-A-l>", ":vertical resize +2<CR>")

-- Format paragraph
keymap("n", "fp", "mz=ip'zk")
keymap("n", "==", "mz=ip`zk")

-- Navigate buffers
keymap("n", "<C-c>", "<Esc>")
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "J", "mzJ`z")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap({ "v", "n" }, "<A-k>", ":m .-2<CR>==")
keymap({ "v", "n" }, "<A-j>", ":m .+1<CR>==")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Buffer
keymap("n", "<leader>q", "<cmd>Bdelete<cr>")
-- Neotree
keymap("n", "<leader>e", ":Neotree toggle<cr>")
-- keymap('n', 'j', '<Plug>(accelerated_jk_gj)')
-- keymap('n', 'k', '<Plug>(accelerated_jk_gk)')

-- Telescope
keymap('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = ' [F]ind [R]ecently opened files' })
keymap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = ' [F]ind existing buffers' })
keymap('n', '<leader>/', function()
    require('telescope.builtin') .current_buffer_fuzzy_find( require('telescope.themes').get_dropdown{ winblend = 10, previewer = false, }) end,
    { desc = '[/] Fuzzily search in current buffer]' })
keymap('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
keymap('n', '<leader>fp', "<cmd>Telescope project<cr>", { desc = '[F]ind [P]rojects' })
keymap('n', '<leader>fe', "<cmd>Telescope frecency<cr>", { desc = '[F]ind fr[E]cency' })
keymap('n', '<leader>fb', "<cmd>Telescope file_browser<cr>", { desc = '[F]ind Browser' })
keymap('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
keymap('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
keymap('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch (inside) [G]it_files' })
keymap('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [M]appings' })
