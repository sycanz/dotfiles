return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    -- theme = 'horizon',
                    -- component_separators = { left = '', right = '' }, -- 
                    component_separators = {},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'filename'},
                    lualine_c = {
                        'branch',
                        'diff',
                        {
                            'diagnostics',
                            sources = { 'nvim_diagnostic', 'coc' },

                            -- Displays diagnostics for the defined severity types
                            sections = { 'error', 'warn', 'info'},

                            diagnostics_color = {
                                -- Same values as the general color option can be used here.
                                error = 'DiagnosticError', -- Changes diagnostics' error color.
                                warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                                info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                            },
                            symbols = { error = ' ', warn = ' ', info = ' ' },
                            colored = true,           -- Displays diagnostics status in color if set to true.
                            update_in_insert = false, -- Update diagnostics in insert mode.
                            always_visible = false,   -- Show diagnostics even if there are none.
                        }
                    },
                    lualine_x = {'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
