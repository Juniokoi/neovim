local function on_attach(_, bufnr)
	local lispmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- LSP keymaps
	lispmap(';r', vim.lsp.buf.rename, '[R]e[n]ame')
	lispmap(';a', vim.lsp.buf.code_action, '[C]ode [A]ction')
	lispmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	lispmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	lispmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	lispmap(';d', vim.lsp.buf.type_definition, 'Type [D]efinition')
	lispmap(';s', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	lispmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	lispmap(';k', vim.lsp.buf.signature_help, 'Signature Documentation')
	lispmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	lispmap(';w', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	lispmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	lispmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	lispmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })

	vim.keymap.set('n', '<space>fa', function() vim.lsp.buf.format { async = true } end)
	vim.keymap.set('n', ';f', function() vim.lsp.buf.format { async = true } end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local servers = {
	sumneko_lua = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				checkThirdParty = false
			},
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" }
			},
		},
	},
}

require("mason").setup()

local mason_lspconfig = require 'mason-lspconfig'

local nvim_lsp = require 'lspconfig'
mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
	automatic_installation = { exclude = { "rust_analyzer" } },
}

mason_lspconfig.setup_handlers {
	function(server_name)
		nvim_lsp[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}

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
					enable = true
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
	}
}


require("rust-tools").setup(opts)
