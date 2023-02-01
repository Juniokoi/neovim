local config = require("modules.utils.config")

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", },
		config = config.neotree
	},

	{ "akinsho/toggleterm.nvim", event="BufEnter", config = config.toggleterm },

	{ "tpope/vim-rhubarb" },

	{ "moll/vim-bbye", cmd = "Bdelete" }, -- Close window without messing up with layout

	{
		"nvim-telescope/telescope-fzf-native.nvim"
		, build = 'make'
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua"
		},
		config = config.telescope
	},

	{
		"anuvyklack/pretty-fold.nvim",
		opts = {
			fill_char = ' ',
			sections = {
				left = {
					'━ ', function() return string.rep('•', vim.v.foldlevel) end, ' ┫', 'content', '┣', 'number_of_folded_lines', ': ', 'percentage', ' ━━',
				},
			},
			matchup_patterns = {
				-- ╟─ Start of line ──╭───────╮── "do" ── End of line ─╢
				--                    ╰─ WSP ─╯
				{ '^%s*do$', 'end' }, -- `do ... end` blocks

				-- ╟─ Start of line ──╭───────╮── "if" ─╢
				--                    ╰─ WSP ─╯
				{ '^%s*if', 'end' },

				-- ╟─ Start of line ──╭───────╮── "for" ─╢
				--                    ╰─ WSP ─╯
				{ '^%s*for', 'end' },

				-- ╟─ "function" ──╭───────╮── "(" ─╢
				--                 ╰─ WSP ─╯
				{ 'function%s*%(', 'end' }, -- 'function(' or 'function ('

				{ '{', '}' },
				{ '%(', ')' }, -- % to escape lua pattern char
				{ '%[', ']' }, -- % to escape lua pattern char
			},
		}
	},

	{ "CKolkey/ts-node-action", event = "VeryLazy" },

	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		ft = "norg",
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {},
					["core.norg.dirman"] = {
						config = { workspaces = { work = "~/notes/work", home = "~/notes/home", } }
					}
				}
			}
		end
	},

	{
		"rmagatti/auto-session",
		event = "VeryLazy",
		cmd = "Autosession",
		opts = {
			log_level = "error",
			auto_save_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "/tmp" },
			cwd_change_handling = {
				restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
				pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
				post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
					require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
				end,
			},

		}
	}

}
