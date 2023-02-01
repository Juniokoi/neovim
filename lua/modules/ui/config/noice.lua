local opts = {
    views = {
        popupmenu = {
            relative = "editor",
            position = "auto",
            size = { width = 60, height = 10 },
            win_options = {
                cursorline = true,
                cursorlineopt = "line",
                winhighlight = {
                    Normal = "NormalFloat", -- change to NormalFloat to make it look like other floats
                    FloatBorder = "NoicePopupmenuBorder", -- border highlight
                    CursorLine = "ContextBlanklineIndent1", -- used for highlighting the selected item
                    PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
                },
            },
            border = { style = "rounded", padding = { 0, 1 }, },
        },
        cmdline_popup = {
            position = { row = 40, col = "50%" },
            size = { width = 60, height = "auto" },
            win_options = {
                winhighlight = {
                    Normal = "NoiceCmdlinePopup",
                    FloatBorder = "NoiceCmdlinePopupBorder",
                    IncSearch = "NoiceCmdlinePopup",
                    Search = "NoiceCmdlinePopup",
                },
                cursorline = false,
            },
        },
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
    },
    lsp = {
        progress = {
            enabled = false,
        },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "nui", -- backend to use to show regular cmdline completions
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons
    },
    -- stylua: ignore
    keys = {
        { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
        { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
        { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
        { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward" },
        { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward"},
    },
}

require("noice").setup(opts)
