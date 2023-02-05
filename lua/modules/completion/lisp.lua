local on_attach = function(client, bufnr)
	-- Set some keybinds conditional on server capabilities
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		local filetype = vim.bo.filetype
		local cwd = vim.fn.getcwd()
		if filetype == "lua" then
			vim.cmd("!stylua . -s --config-path " .. cwd .. "/.stylua.toml")
			vim.api.nvim_input("a<cr>") -- an confirm screen shows up, this line supress it
			vim.lsp.buf.format()
		elseif filetype == "rust" then
			vim.cmd("!rustfmt")
			vim.lsp.buf.format()
		else
			vim.lsp.buf.format()
		end
	end, { desc = "Format current buffer with LSP" })
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.lsp.start({
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
		})
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {
	sumneko_lua = {
		Lua = {
			format = {
				enable = true,
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
			},
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

local nvim_lsp = require("lspconfig")
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = { exclude = { "rust_analyzer" } },
})

mason_lspconfig.setup_handlers({
	function(server_name)
		nvim_lsp[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

vim.opt.shortmess = vim.opt.shortmess + "c"

local opts = {
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					-- loadOutDirsFromCheck = true,
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
				-- assist = {
				-- 	importGranularity = "module",
				-- 	importPrefix = "by_self",
				-- },
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
}

require("rust-tools").setup(opts)
