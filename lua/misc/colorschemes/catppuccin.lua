local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    vim.cmd.colorscheme "habamax"
    return
end

catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
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
    color_overrides = {},
    highlight_overrides = {
        all = function(colors) 
            return {
                ColorColumn = { bg = colors.flamingo },
                CursorLine = {  bg = colors.flamingo },
                CursorLineNr = { bg = colors.flamingo},
                LineNrAbove = { fg = colors.flamingo,},
                LineNrBelow = { fg = colors.flamingo,},

                NoiceCmdlinePopup = { fg = colors.flamingo,},
                NoiceFormatConfirm = { fg = colors.flamingo,},
                NoiceCmdlinePopupBorderCmdline = { fg = colors.flamingo,},
                NoiceMini = { fg = colors.flamingo, bg = colors.flamingo,},

                IndentBlanklineIndent1 = { fg = colors.flamingo },
                IndentBlanklineIndent2 = { fg = colors.flamingo },
                IndentBlanklineIndent3 = { fg = "#280034" },
                IndentBlanklineIndent4 = { fg = "#282C00" },
                IndentBlanklineIndent5 = { fg = "#200C34" },
                IndentBlanklineIndent6 = { fg = "#082034" },
                IndentBlanklineContextChar = { fg = "#00ff00" },

                ContextBlanklineIndent1 = { fg = colors.flamingo, },
                ContextBlanklineIndent2 = { fg = colors.flamingo, },
                ContextBlanklineIndent3 = { fg = colors.flamingo, },
                ContextBlanklineIndent4 = { fg = colors.flamingo, },
                ContextBlanklineIndent5 = { fg = colors.flamingo, },
                ContextBlanklineIndent6 = { fg = colors.flamingo, },
                MiniAnimateCursor       = { fg = "NONE", bg = colors.flamingo },
            }
        end
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

vim.cmd.colorscheme "catppuccin"
