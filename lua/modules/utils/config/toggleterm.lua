function _G.set_terminal_keymaps()
	local opts = { silent = true, noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

function _Rust_toggle()
	local rust = Terminal:new({
		cmd = "cargo run",
		direction = "float",
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<esc>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
	})

	rust:toggle()
end

function _Lazygit_toggle()
	local lazygit = Terminal:new({
		cmd = "lazygit",
		direction = "float",
		hidden = true,
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
	})

	lazygit:toggle()
end

function _Htop_toggle()
	local htop = Terminal:new({ cmd = "htop", hidden = true })
	htop:toggle()
end

require("toggleterm").setup({
	size = 10,
	open_mapping = [[<A-;>]],
	hide_numbers = true,
	shade_terminals = false,
	shading_factor = 0,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = "/bin/fish",
	highlights = {
		Normal = {
			guibg = "#282c34",
		},
		NormalFloat = {
			guibg = "#282c34",
		},
		FloatBorder = {
			guibg = "#282c34",
		},
	},
	float_opts = {
		border = "rounded",
		winblend = 10,
		highlights = {
			border = "#8c6dff",
			background = "#282827",
		},
	},
})
