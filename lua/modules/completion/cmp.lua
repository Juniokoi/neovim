local _,cmp = pcall(require, "cmp")
local _,luasnip = pcall(require, "luasnip")

local cmp_select = function(pos, count)
	if count then
		if pos == "next" then
		return cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = count })
		else
		return cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = count })
		end
	else
		if pos == "next" then
		return cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select})
		else
		return cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select})
		end
	end

end

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local border = {
	{ "╭", "CmpBorder" },
	{ "─", "CmpBorder" },
	{ "╮", "CmpBorder" },
	{ "│", "CmpBorder" },
	{ "╯", "CmpBorder" },
	{ "─", "CmpBorder" },
	{ "╰", "CmpBorder" },
	{ "│", "CmpBorder" },
}
cmp.event:on(
	"confirm_done",
	require'nvim-autopairs.completion.cmp'.on_confirm_done { map_char = { tex = "" } }
)
cmp.setup {

	snippet = {
		expand = function(args)
			require'luasnip'.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert {
		['<C-k>'] = cmp_select("prev"),
		['<C-j>'] = cmp_select("next"),
		['<C-u>'] = cmp_select("prev",4),
		['<C-d>'] = cmp_select("next",4),
		['<C-p>'] = cmp.mapping.scroll_docs(-4),
		['<C-n>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace
		},
		["<Tab>"] = cmp.mapping(function(fallback)
			local copilot_keys = vim.fn["copilot#Accept"]("")
			if cmp.visible() then
				cmp.select_next_item()
			elseif copilot_keys ~= "" then
				vim.api.nvim_feedkeys(copilot_keys, "i", false)
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete({ select = false }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' }
		}, {
			{name = 'buffer', keyword_lenght = 3}
	}),

	window = {
		documentation = cmp.config.window.bordered(),
		completion = {
			border = border,
			scrollbar = '║',

			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},

	experimental = {
		ghost_text = {
			hl_group = "LspCodeLens",
		},
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end
	},
}
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
		}, {
			{ name = 'cmdline' }
	})
})

