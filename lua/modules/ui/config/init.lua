local config = {
	init = {},
	opts = {},
	keys = {},
}

function config.bufferline() require("modules.ui.config.bufferline") end

function config.noice() require("modules.ui.config.noice") end

function config.animate()
	-- No need to copy this inside `setup()`. Will be used automatically.
	local animate = require("mini.animate")
	animate.setup({
		-- Cursor path
		animations = {
			{
				trigger = { "BufRead", "BufNewFile" },
				anim = {
					{ "mini", "fadeIn" },
					{ "mini", "slideInRight" },
				},
			},
			{
				trigger = { "BufLeave" },
				anim = {
					{ "mini", "fadeOut" },
					{ "mini", "slideOutRight" },
				},
			},
		},
		cursor = {
			-- Whether to enable this animation
			enable = true,
			timing = animate.gen_timing.linear({ easing = "out", duration = 25, unit = "total" }),
			path = animate.gen_path.line({
				predicate = function() return true end,
			}),
		},

		-- Vertical scroll
		scroll = {
			enable = false,
		},

		-- Window resize
		resize = {
			enable = false,
		},

		-- Window open
		open = {
			enable = false,
		},

		-- Window close
		close = {
			-- Whether to enable this animation
			enable = false,
		},
	})
end

function config.alpha() require("modules.ui.config.dashboard") end

function config.illuminate()
	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetypes_denylist = {
			"alpha",
			"dashboard",
			"DoomInfo",
			"fugitive",
			"help",
			"norg",
			"NvimTree",
			"Outline",
			"toggleterm",
		},
		under_cursor = false,
	})
end

function config.lualine() require("modules.ui.config.lualine") end

function config.specs()
	require("specs").setup({
		show_jumps = true,
		min_jump = 30,
		popup = {
			delay_ms = 10, -- delay before popup displays
			inc_ms = 10, -- time increments used for fade/resize effects
			blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
			width = 10,
			winhl = "Search",
			fader = require("specs").linear_fader,
			resizer = require("specs").shrink_resizer,
		},
		ignore_filetypes = {},
		ignore_buftypes = {
			nofile = true,
		},
	})
end

function config.init.navic()
	vim.g.navic_silence = true
	require("misc").on_attach(function(client, buffer)
		if client.server_capabilities.documentSymbolProvider then require("nvim-navic").attach(client, buffer) end
	end)
end

function config.opts.navic()
	return {
		separator = " ",
		highlight = true,
		depth_limit = 5,
	}
end

function config.init.dressing()
	vim.ui.select = function(...)
		require("lazy").load({ plugins = { "dressing.nvim" } })
		return vim.ui.select(...)
	end
end

function config.opts.notify()
	return {
		background_colour = "#1e222a",
		timeout = 3000,
		max_height = function() return math.floor(vim.o.lines * 0.75) end,
		max_width = function() return math.floor(vim.o.columns * 0.75) end,
	}
end

function config.keys.notify()
	return {
		{
			"<leader>dn",
			function() require("notify").dismiss({ silent = true, pending = true }) end,
			desc = "Delete all Notifications",
		},
	}
end

return config
