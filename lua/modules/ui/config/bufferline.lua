vim.opt.mousemoveevent = true

require("bufferline").setup({
	options = {
		numbers = function(opts) return string.format("%s", opts.lower(opts.ordinal)) end,
		mode = "buffers",
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		hover = {
			enabled = true,
			reveal = { "buffer_close", "close" },
			highlight = "Comment",
		},
		color_icons = true, -- | false, -- whether or not to add the filetype icon highlights
		indicator = { icon = "▎" },
		buffer_close_icon = "",
		modified_icon = "●",
		truncate_names = true,
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 22,
		diagnostics = false, -- | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		offsets = {
			{
				filetype = { "Neotree", "neotree", "Neo-tree", "neo-tree", "NvimTree" },
				text = "Explorer",
				highlight = "Directory",
				text_align = "center",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = false,
	},
})
