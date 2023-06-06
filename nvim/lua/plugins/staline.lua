return {
    {
        'tamton-aquib/staline.nvim',
        lazy = false,
        config = function()
            require('stabline').setup {
                fg = '#84a598',
                inactive_fg = '#aaaaaa',
                stab_right = '',
                stab_left = '',
            }

            -- old config
            -- require 'staline'.setup {
            --     sections = {
            --         left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
            --         mid = { 'file_name' },
            --         right = { 'line_column' }
            --     },
            --     mode_colors = {
            --         i = '#d4be98',
            --         n = '#84a598',
            --         c = '#8fbf7f',
            --         v = '#fc802d',
            --     },
            --     defaults = {
            --         true_colors = true,
            --         line_column = ' [%l/%L] :%c  ',
            --         branch_symbol = ' ',
            --     }
            --[[ } ]]
        end
    },
    {
        'famiu/feline.nvim',
        lazy = false,
        config = function()
            ---depends om https://github.com/feline-nvim/feline.nvim
            local present, feline = pcall(require, "feline")

            if not present then
                return
            end

            local theme = {
                aqua = "#7AB0DF",
                bg = "#1C212A",
                blue = "#5FB0FC",
                cyan = "#70C0BA",
                darkred = "#FB7373",
                fg = "#C7C7CA",
                gray = "#222730",
                green = "#79DCAA",
                lime = "#54CED6",
                orange = "#FFD064",
                pink = "#D997C8",
                purple = "#C397D8",
                red = "#F87070",
                yellow = "#FFE59E"
            }

            local mode_theme = {
                ["NORMAL"] = theme.green,
                ["OP"] = theme.cyan,
                ["INSERT"] = theme.aqua,
                ["VISUAL"] = theme.yellow,
                ["LINES"] = theme.darkred,
                ["BLOCK"] = theme.orange,
                ["REPLACE"] = theme.purple,
                ["V-REPLACE"] = theme.pink,
                ["ENTER"] = theme.pink,
                ["MORE"] = theme.pink,
                ["SELECT"] = theme.darkred,
                ["SHELL"] = theme.cyan,
                ["TERM"] = theme.lime,
                ["NONE"] = theme.gray,
                ["COMMAND"] = theme.blue,
            }

            local component = {}

            component.vim_mode = {
                provider = function()
                    return vim.api.nvim_get_mode().mode:upper()
                end,
                hl = function()
                    return {
                        fg = "bg",
                        bg = require("feline.providers.vi_mode").get_mode_color(),
                        style = "bold",
                        name = "NeovimModeHLColor",
                    }
                end,
                left_sep = "block",
                right_sep = "block",
            }

            component.git_branch = {
                provider = "git_branch",
                hl = {
                    fg = "fg",
                    bg = "bg",
                    style = "bold",
                },
                left_sep = "block",
                right_sep = "",
            }

            component.git_add = {
                provider = "git_diff_added",
                hl = {
                    fg = "green",
                    bg = "bg",
                },
                left_sep = "",
                right_sep = "",
            }

            component.git_delete = {
                provider = "git_diff_removed",
                hl = {
                    fg = "red",
                    bg = "bg",
                },
                left_sep = "",
                right_sep = "",
            }

            component.git_change = {
                provider = "git_diff_changed",
                hl = {
                    fg = "purple",
                    bg = "bg",
                },
                left_sep = "",
                right_sep = "",
            }

            component.separator = {
                provider = "",
                hl = {
                    fg = "bg",
                    bg = "bg",
                },
            }

            component.diagnostic_errors = {
                provider = "diagnostic_errors",
                hl = {
                    fg = "red",
                },
            }

            component.diagnostic_warnings = {
                provider = "diagnostic_warnings",
                hl = {
                    fg = "yellow",
                },
            }

            component.diagnostic_hints = {
                provider = "diagnostic_hints",
                hl = {
                    fg = "aqua",
                },
            }

            component.diagnostic_info = {
                provider = "diagnostic_info",
            }

            component.lsp = {
                hl = function()
                    local progress = vim.lsp.util.get_progress_messages()[1]
                    return {
                        fg = progress and "yellow" or "green",
                        bg = "gray",
                        style = "bold",
                    }
                end,
                left_sep = "",
                right_sep = "block",
            }

            component.file_type = {
                provider = {
                    name = "file_type",
                    opts = {
                        filetype_icon = true,
                    },
                },
                hl = {
                    fg = "fg",
                    bg = "gray",
                },
                left_sep = "block",
                right_sep = "block",
            }

            component.scroll_bar = {
                provider = function()
                    local chars = {
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                        " ",
                    }
                    local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
                    local position = math.floor(line_ratio * 100)

                    if position <= 5 then
                        position = " TOP"
                    elseif position >= 95 then
                        position = " BOT"
                    else
                        position = chars[math.floor(line_ratio * #chars)] .. position
                    end
                    return position
                end,
                hl = function()
                    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
                    local fg
                    local style

                    if position <= 5 then
                        fg = "aqua"
                        style = "bold"
                    elseif position >= 95 then
                        fg = "red"
                        style = "bold"
                    else
                        fg = "purple"
                        style = nil
                    end
                    return {
                        fg = fg,
                        style = "bold",
                        bg = "bg",
                    }
                end,
                left_sep = "block",
                right_sep = "block",
            }

            local left = {
                component.vim_mode,
                component.file_type,
                component.git_branch,
                component.git_add,
                component.git_delete,
                component.git_change,
                component.separator,
                component.diagnostic_errors,
                component.diagnostic_warnings,
                component.diagnostic_info,
                component.diagnostic_hints,
                component.scroll_bar,
            }
            local middle = {}
            local right = {}

            local components = {
                active = {
                    left,
                    middle,
                    right,
                },
            }

            feline.setup({
                components = components,
                theme = theme,
                vi_mode_colors = mode_theme,
            })
        end
    }
}
