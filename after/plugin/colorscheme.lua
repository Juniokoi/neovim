local ok, catppuccin = pcall(require, "catppuccin")
local _ok, ucolors = pcall(require, "catppuccin.utils.colors")

if not ok or not _ok then
	vim.cmd.colorscheme("desert")
	return
end

local transparent_background = false -- Set background transparency here!

local transparent = function(cp)
	if transparent_background then
		return cp.none
	else
		return cp.base
	end
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		rosewater = "#FFA18F",
		flamingo = "#FF5C5C",
		mauve = "#CC6CFF",
		pink = "#FF7BDB",
		red = "#FF4E84",
		sapphire = "#36D0E0",
		maroon = "#E45B74",
		peach = "#F4A36E",
		yellow = "#FAE3B0",
		green = "#80FF90",
		blue = "#53B1FF",
		sky = "#6BE8FF",
		teal = "#96FFEE",
		lavender = "#8191FE",

		text = "#D9E0EE",
		subtext1 = "#BAC2DE",
		subtext0 = "#A6ADC8",
		overlay2 = "#C3BAC6",
		overlay1 = "#988BA2",
		overlay0 = "#6E6C7E",
		surface2 = "#6E6C7E",
		surface1 = "#575268",
		surface0 = "#302D41",

		base = "#1E1E2E",
		mantle = "#1A1826",
		crust = "#161320",
	},
	highlight_overrides = {
		all = function(cp)
			return {
				-- ucp.darken(dark color, percentage, base color)
				Comment = { fg = ucolors.darken(cp.base, 0.3, cp.sky), bg = transparent(cp) },
				CursorColumn = { bg = cp.surface0 },
				CursorLine = { bg = cp.surface0 },
				LineNr = { bg = transparent(cp) },
				LineNrAbove = { bg = cp.mantle },
				LineNrBelow = { bg = cp.base },

				Normal = { fg = cp.text, bg = transparent(cp) }, -- Normal is for current window
				NormalNC = { fg = cp.text, bg = transparent(cp) }, -- NormalNC is for non-current windows
				NormalFloat = { fg = cp.text, bg = cp.base }, -- NormalFloat is for floating windows

				NoiceCmdlinePopup = { fg = cp.flamingo },
				NoiceFormatConfirm = { fg = cp.flamingo },
				NoiceCmdlinePopupBorderCmdline = { fg = cp.flamingo },
				NoiceMini = { fg = cp.flamingo, bg = cp.surface1 },

				PanelHeading = { fg = cp.lavender, style = { "bold", "italic" } },

				LazyH1 = { bg = "NONE", fg = cp.lavender, style = { "bold" } },
				LazyButton = { bg = "NONE", fg = cp.overlay0 },
				LazyButtonActive = { bg = "NONE", fg = cp.lavender, style = { " bold" } },
				LazySpecial = { fg = cp.sapphire },

				-- LazyH1 = { bg = cp.peach, fg = cp.base, style = { "bold" } },
				-- LazyButton = { bg = "NONE", fg = cp.subtext0 },
				-- LazyButtonActive = { bg = cp.overlay1, fg = cp.base, style = { " bold" } },
				-- LazySpecial = { fg = cp.sapphire },

				-- overrider
				FloatBorder = { fg = cp.overlay1, bg = transparent(cp) },
				TelescopeBorder = { fg = cp.overlay1 },
				WhichKeyBorder = { fg = cp.overlay1 },
				NeoTreeFloatBorder = { fg = cp.overlay1 },

				IndentBlanklineContextChar = { fg = cp.none },
				IndentBlanklineIndent1 = { fg = cp.flamingo },
				IndentBlanklineIndent2 = { fg = cp.flamingo },
				IndentBlanklineIndent3 = { fg = "#280034" },
				IndentBlanklineIndent4 = { fg = "#282C00" },
				IndentBlanklineIndent5 = { fg = "#200C34" },
				IndentBlanklineIndent6 = { fg = "#082034" },

				ContextBlanklineIndent1 = { fg = cp.flamingo },
				ContextBlanklineIndent2 = { fg = cp.flamingo },
				ContextBlanklineIndent3 = { fg = cp.flamingo },
				ContextBlanklineIndent4 = { fg = cp.flamingo },
				ContextBlanklineIndent5 = { fg = cp.flamingo },
				ContextBlanklineIndent6 = { fg = cp.flamingo },
				MiniAnimateCursor = { fg = "NONE", bg = cp.flamingo },
				CursorLineNr = { fg = cp.green, bold = true },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },
				Keyword = { fg = cp.pink },
				Type = { fg = cp.blue },
				Typedef = { fg = cp.yellow },
				StorageClass = { fg = cp.red, style = { "italic" } },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For fidget.
				FidgetTask = { bg = cp.base, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For trouble.nvim
				TroubleNormal = { bg = cp.base },
				--
				-- -- For treesitter.
				-- ["@field"] = { fg = cp.mauve },
				-- ["@property"] = { fg = cp.lavender },
				--
				-- ["@include"] = { fg = cp.teal },
				-- -- ["@operator"] = { fg = cp.sky },
				-- ["@keyword.operator"] = { fg = cp.sky },
				-- ["@punctuation.special"] = { fg = cp.maroon },
				--
				-- -- ["@float"] = { fg = cp.peach },
				-- -- ["@number"] = { fg = cp.peach },
				-- -- ["@boolean"] = { fg = cp.peach },
				--
				-- ["@constructor"] = { fg = cp.lavender },
				-- -- ["@constant"] = { fg = cp.peach },
				-- -- ["@conditional"] = { fg = cp.mauve },
				-- -- ["@repeat"] = { fg = cp.mauve },
				-- ["@exception"] = { fg = cp.peach },
				--
				-- ["@constant.builtin"] = { fg = cp.lavender },
				-- -- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
				-- -- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
				-- ["@type.qualifier"] = { link = "@keyword" },
				["@variable.builtin"] = { fg = cp.red, style = { "italic" } },
				--
				-- -- ["@function"] = { fg = cp.blue },
				-- ["@function.macro"] = { fg = cp.red, style = {} },
				-- ["@parameter"] = { fg = cp.rosewater },
				["@keyword"] = { fg = cp.red, style = { "italic" } },
				["@keyword.function"] = { fg = cp.maroon },
				["@keyword.return"] = { fg = cp.pink, style = {} },
				--
				-- -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
				-- -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
				-- -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
				-- -- ["@constant.macro"] = { fg = cp.mauve },
				--
				-- -- ["@label"] = { fg = cp.blue },
				-- ["@method"] = { fg = cp.blue, style = { "italic" } },
				-- ["@namespace"] = { fg = cp.rosewater, style = {} },
				--
				-- ["@punctuation.delimiter"] = { fg = cp.teal },
				-- ["@punctuation.bracket"] = { fg = cp.overlay2 },
				-- -- ["@string"] = { fg = cp.green },
				-- -- ["@string.regex"] = { fg = cp.peach },
				-- ["@type"] = { fg = cp.yellow },
				-- ["@variable"] = { fg = cp.text },
				-- ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
				-- ["@tag"] = { fg = cp.peach },
				-- ["@tag.delimiter"] = { fg = cp.maroon },
				-- ["@text"] = { fg = cp.text },
				--
				-- -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
				-- -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
				-- -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
				-- -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
				-- -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
				-- -- ["@string.escape"] = { fg = cp.pink },
				--
				-- -- ["@property.toml"] = { fg = cp.blue },
				-- -- ["@field.yaml"] = { fg = cp.blue },
				--
				-- -- ["@label.json"] = { fg = cp.blue },
				--
				-- ["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
				-- ["@parameter.bash"] = { fg = cp.red, style = { "italic" } },
				--
				-- ["@field.lua"] = { fg = cp.lavender },
				-- ["@constructor.lua"] = { fg = cp.flamingo },
				--
				-- ["@constant.java"] = { fg = cp.teal },
				--
				-- ["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
				-- -- ["@constructor.typescript"] = { fg = cp.lavender },
				--
				-- -- ["@constructor.tsx"] = { fg = cp.lavender },
				-- -- ["@tag.attribute.tsx"] = { fg = cp.mauve },
				--
				-- ["@type.css"] = { fg = cp.lavender },
				-- ["@property.css"] = { fg = cp.yellow, style = { "italic" } },
				--
				-- ["@type.builtin.c"] = { fg = cp.yellow, style = {} },
				--
				-- ["@property.cpp"] = { fg = cp.text },
				-- ["@type.builtin.cpp"] = { fg = cp.yellow, style = {} },

				-- ["@symbol"] = { fg = cp.flamingo },
			}
		end,
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- vim.cmd("CatppuccinCompile")
vim.cmd.colorscheme("catppuccin")
