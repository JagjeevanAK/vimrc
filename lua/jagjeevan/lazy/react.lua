return {
    -- React specific development tools
    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    -- Defaults
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
                -- Also override individual filetype configs, these take priority.
                -- Empty by default, useful if one of the "opts" global settings
                -- doesn't work well in a specific filetype
                per_filetype = {
                    ["html"] = {
                        enable_close = false
                    }
                }
            })
        end,
    },
    
    -- Better syntax highlighting for JSX
    {
        "MaxMEllon/vim-jsx-pretty",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    
    -- Auto close and rename HTML/JSX tags
    {
        "AndrewRadev/tagalong.vim",
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
        config = function()
            vim.g.tagalong_additional_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
        end,
    },
    
    -- Improved indentation for JavaScript and TypeScript
    {
        "pangloss/vim-javascript",
        ft = { "javascript", "javascriptreact" },
    },
    
    -- TypeScript syntax highlighting
    {
        "leafgarland/typescript-vim",
        ft = { "typescript", "typescriptreact" },
    },
    
    -- Better React/JSX support
    {
        "yuezk/vim-js",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    
    -- Package.json utilities
    {
        "vuki656/package-info.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        ft = "json",
        config = function()
            require('package-info').setup({
                colors = {
                    up_to_date = "#3C4048", -- Text color for up to date package versions
                    outdated = "#fc514e", -- Text color for outdated package versions
                },
                icons = {
                    enable = true, -- Whether to display icons
                    style = {
                        up_to_date = "|  ", -- Icon for up to date packages
                        outdated = "|  ", -- Icon for outdated packages
                    },
                },
                autostart = true, -- Whether to autostart when package.json is opened
                hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
                hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
            })
            
            -- Keymaps for package-info
            vim.keymap.set("n", "<leader>psv", require("package-info").show, { desc = "Show dependency versions" })
            vim.keymap.set("n", "<leader>pc", require("package-info").hide, { desc = "Hide dependency versions" })
            vim.keymap.set("n", "<leader>pt", require("package-info").toggle, { desc = "Toggle dependency versions" })
            vim.keymap.set("n", "<leader>pu", require("package-info").update, { desc = "Update dependency on the line" })
            vim.keymap.set("n", "<leader>pd", require("package-info").delete, { desc = "Delete dependency on the line" })
            vim.keymap.set("n", "<leader>pi", require("package-info").install, { desc = "Install a new dependency" })
            vim.keymap.set("n", "<leader>pv", require("package-info").change_version, { desc = "Change dependency version" })
        end,
    },
    
    -- REST client for testing APIs (useful for React apps)
    {
        "rest-nvim/rest.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = "http",
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- stay in current window (.http file) or change to results window (default)
                stay_in_current_window_after_split = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    show_curl_command = false,
                    show_http_info = true,
                    show_headers = true,
                    -- table of curl `--write-out` variables or false if disabled
                    show_statistics = false,
                    -- executables or functions for formatting response body [optional]
                    -- set them to false if you want to disable them
                    formatters = {
                        json = "jq",
                        html = function(body)
                            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
                        end
                    },
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true,
            })
            
            vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run REST request" })
            vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc = "Run last REST request" })
        end,
    },
}
