local config = require("modules.ui.config")

return {
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = config.lualine
	},

	{
		"edluffy/specs.nvim",
		config = config.specs,
	},

	{
		"rcarriga/nvim-notify",
		keys = config.keys.notify,
		opts = config.opts.notify
	},

	{
		"RRethy/vim-illuminate",
		name = "illuminate",
		config = config.illuminate
	},

	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = config.init.dressing
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = config.alpha,
	},

	-- { "echasnovski/mini.animate", version = false, config = config.animate, },

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = config.bufferline,
	},

	{ "akinsho/toggleterm.nvim", lazy = true },

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = config.noice,
	},

	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = config.init.navic,
		opts = config.opts.navic
	},

	{ "MunifTanjim/nui.nvim", lazy = true },

	-- Themes
	{ "rebelot/kanagawa.nvim", lazy = "VeryLazy", },
	{ "folke/tokyonight.nvim", lazy = "VeryLazy", },
	{ "rose-pine/neovim", lazy = "VeryLazy", name = "rose-pine" },
	{ "catppuccin/nvim", lazy = false, name = "catppuccin" },
}
