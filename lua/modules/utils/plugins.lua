local config = require("modules.utils.config")

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		config = config.neotree,
	},

	{ "akinsho/toggleterm.nvim", event = "BufEnter", config = config.toggleterm },

	{ "tpope/vim-rhubarb" },

	{ "moll/vim-bbye", cmd = "Bdelete" }, -- Close window without messing up with layout

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua",
		},
		config = config.telescope,
	},

	{
		"anuvyklack/pretty-fold.nvim",
		config = config.pretty_fold,
	},

	{ "CKolkey/ts-node-action", event = "VeryLazy" },

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		ft = "norg",
		config = config.neorg,
	},

	{
		"rmagatti/auto-session",
		event = "VeryLazy",
		cmd = "Autosession",
		config = config.auto_session,
	},
}
