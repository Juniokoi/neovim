require("rose-pine").setup({
	disable_background = true,
	bold_vert_split = true,
	groups = {
		background = "base",
		panel = "surface",
		border = "highlight_med",
		comment = "iris",
		link = "iris",
		punctuation = "foam",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},
	highlight_groups = {
		Comment = { fg = "iris" },
	},
})

vim.cmd("colorscheme rose-pine")
