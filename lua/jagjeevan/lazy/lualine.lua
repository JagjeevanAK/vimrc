return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        newfile_status = false,
                        path = 1,
                        shorting_target = 40,
                        symbols = {
                            modified = '[+]',
                            readonly = '[RO]',
                            unnamed = '[No Name]',
                            newfile = '[New]',
                        }
                    }
                },
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {
                    function()
                        local handle = io.popen("pmset -g batt | awk '/%/ {gsub(/;/,\"\"); print $3}'")
                        if handle then
                            local result = handle:read("*l")
                            handle:close()
                            if result then
                                local pct = tonumber(result:match("(%d+)")) or 0
                                local icon = pct >= 75 and "󰁹" or pct >= 50 and "󰁿" or pct >= 25 and "󰁽" or "󰁻"
                                return icon .. " " .. pct .. "%%"
                            end
                        end
                        return "󰂑 --"
                    end
                },
                lualine_z = {
                    function()
                        local utc_time = os.time(os.date("!*t"))
                        local ist_time = utc_time + (5 * 3600) + (30 * 60)
                        return "󰥔 " .. os.date("%I:%M %p", ist_time)
                    end
                }
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
            extensions = {'fugitive', 'trouble'}
        })
    end,
}
