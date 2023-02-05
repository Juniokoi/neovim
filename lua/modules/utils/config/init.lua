local config = {}

function config.telescope() require("modules.utils.config.telescope") end

function config.neotree() require("modules.utils.config.neotree") end

function config.toggleterm() require("modules.utils.config.toggleterm") end

function config.neorg() require("modules.utils.config.neorg") end

function config.auto_session()
	require("auto-session").setup({
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
	})
end

function config.pretty_fold()
	require("pretty-fold").setup({
		opts = {
			fill_char = " ",
			sections = {
				left = {
					"━ ",
					function() return string.rep("•", vim.v.foldlevel) end,
					" ┫",
					"content",
					"┣",
					"number_of_folded_lines",
					": ",
					"percentage",
					" ━━",
				},
			},
			matchup_patterns = {
				-- ╟─ Start of line ──╭───────╮── "do" ── End of line ─╢
				--                    ╰─ WSP ─╯
				{ "^%s*do$", "end" }, -- `do ... end` blocks

				-- ╟─ Start of line ──╭───────╮── "if" ─╢
				--                    ╰─ WSP ─╯
				{ "^%s*if", "end" },

				-- ╟─ Start of line ──╭───────╮── "for" ─╢
				--                    ╰─ WSP ─╯
				{ "^%s*for", "end" },

				-- ╟─ "function" ──╭───────╮── "(" ─╢
				--                 ╰─ WSP ─╯
				{ "function%s*%(", "end" }, -- 'function(' or 'function ('

				{ "{", "}" },
				{ "%(", ")" }, -- % to escape lua pattern char
				{ "%[", "]" }, -- % to escape lua pattern char
			},
		},
	})
end

return config
