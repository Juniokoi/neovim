require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.clipboard"] = {},
		["core.clipboard.code-blocks"] = {},
		["core.norg.concealer"] = {
			config = {
				dim_code_blocks = {
					enabled = true,
					conceal = true,
					content_only = true,
					adaptive = true,
				},
				preset = "diamond",
			},
		},
		["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
		["core.norg.journal"] = {},
		["core.norg.qol.toc"] = {},
		["core.presenter"] = {
			config = { zen_mode = "zen-mode" },
		},
		["core.norg.dirman"] = {
			config = { workspaces = { work = "~/notes/work", home = "~/notes/home" } },
		},
	},
})
