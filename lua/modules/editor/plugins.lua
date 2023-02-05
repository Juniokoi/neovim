local load = require("modules.editor.config")

return {
	{
		"windwp/nvim-autopairs",
		name = "npairs",
		opts = load.opts_npairs,
	}, -- Autopairs, integrates with both cmp and treesitter

	{
		"numToStr/Comment.nvim",
		config = true,
	}, -- Easily comment stuff

	{
		"phaazon/hop.nvim",
		version = "v2",
		config = load.hop.config,
		opts = load.hop.opts,
	},

	{
		"kylechui/nvim-surround",
		config = true,
	},

	{
		"ThePrimeagen/harpoon",
		config = true,
	},

	{ "github/copilot.vim" },

	{
		"abecodes/tabout.nvim",
		config = load.tabout,
	},

	{ "nvim-lua/popup.nvim" },

	{
		"mg979/vim-visual-multi",
		name = "multicursor",
	},

	{ "folke/zen-mode.nvim" },

	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			"*",
			"!lazy",
			DEFAULT_OPTIONS = {
				names = false,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
			},
		},
	},

	{
		"tpope/vim-sleuth",
		event = "VeryLazy",
	}, -- Detect tabstop and shiftwidth automatically

	{
		"karb94/neoscroll.nvim",
		config = load.neoscroll,
		event = "BufEnter",
	},

	{
		"max397574/better-escape.nvim",
		name = "better_scape",
		lazy = true,
		event = "VeryLazy",
		config = load.betterscape,
	},

	-- {
	-- 	"rainbowhxch/accelerated-jk.nvim",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- 	config = load.accelerated_jk.config
	-- }
}
