return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "windwp/nvim-autopairs",  -- Add this plugin for autopairs
    },

    config = function()
        local cmp = require('cmp')
        local cmp_compare = require('cmp.config.compare')
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_kinds = cmp.lsp.CompletionItemKind
        local kind_rank = {
            [cmp_kinds.Field] = 1,
            [cmp_kinds.Method] = 2,
            [cmp_kinds.Function] = 3,
            [cmp_kinds.Variable] = 4,
            [cmp_kinds.Property] = 5,
            [cmp_kinds.Constant] = 6,
        }

        local function kind_priority(entry1, entry2)
            local k1 = kind_rank[entry1:get_kind()] or 10
            local k2 = kind_rank[entry2:get_kind()] or 10
            if k1 ~= k2 then
                return k1 < k2
            end
        end
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "pyright",
                "clangd",
                "ts_ls",
                "eslint",
                "tailwindcss",
                "emmet_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["rust_analyzer"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.rust_analyzer.setup {
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                -- Run checks on save, but keep them lightweight.
                                checkOnSave = true,
                                check = {
                                    command = "check",
                                    allTargets = false,
                                    workspace = false,
                                },
                            },
                        },
                    }
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,

                ["ts_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup {
                        capabilities = capabilities,
                        filetypes = { 
                            "javascript", 
                            "javascriptreact", 
                            "typescript", 
                            "typescriptreact",
                            "vue",
                            "json"
                        },
                        settings = {
                            typescript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = 'all',
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                }
                            },
                            javascript = {
                                inlayHints = {
                                    includeInlayParameterNameHints = 'all',
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                }
                            }
                        }
                    }
                end,

                ["eslint"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.eslint.setup {
                        capabilities = capabilities,
                        filetypes = { 
                            "javascript", 
                            "javascriptreact", 
                            "typescript", 
                            "typescriptreact",
                            "vue",
                            "svelte"
                        },
                        settings = {
                            codeAction = {
                                disableRuleComment = {
                                    enable = true,
                                    location = "separateLine"
                                },
                                showDocumentation = {
                                    enable = true
                                }
                            },
                            codeActionOnSave = {
                                enable = false,
                                mode = "all"
                            },
                            format = true,
                            nodePath = "",
                            onIgnoredFiles = "off",
                            packageManager = "npm",
                            quiet = false,
                            rulesCustomizations = {},
                            run = "onType",
                            useESLintClass = false,
                            validate = "on",
                            workingDirectory = {
                                mode = "location"
                            }
                        }
                    }
                end,

                ["tailwindcss"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.tailwindcss.setup {
                        capabilities = capabilities,
                        filetypes = { 
                            "html", 
                            "css", 
                            "scss", 
                            "javascript", 
                            "javascriptreact", 
                            "typescript", 
                            "typescriptreact",
                            "vue",
                            "svelte"
                        },
                        settings = {
                            tailwindCSS = {
                                classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
                                lint = {
                                    cssConflict = "warning",
                                    invalidApply = "error",
                                    invalidConfigPath = "error",
                                    invalidScreen = "error",
                                    invalidTailwindDirective = "error",
                                    invalidVariant = "error",
                                    recommendedVariantOrder = "warning"
                                },
                                validate = true
                            }
                        }
                    }
                end,

                ["emmet_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.emmet_ls.setup {
                        capabilities = capabilities,
                        filetypes = { 
                            "html", 
                            "css", 
                            "scss", 
                            "javascript", 
                            "javascriptreact", 
                            "typescript", 
                            "typescriptreact",
                            "vue",
                            "svelte"
                        },
                        init_options = {
                            html = {
                                options = {
                                    ["bem.enabled"] = true,
                                },
                            },
                        }
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
               end,
                ["pyright"] = function()  -- Python server configuration
                    local lspconfig = require("lspconfig")
                    lspconfig.pyright.setup {
                        capabilities = capabilities,
                        filetypes = { "python" },  -- Ensure it only works for Python files
                    }
                end,

                ["clangd"] = function()  -- C/C++ server configuration
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {
                        capabilities = capabilities,
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- Completion navigation keymaps
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Select previous completion item
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Select next completion item
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selected completion
                ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
            }),
            completion = {
                autocomplete = {
                    require('cmp.types').cmp.TriggerEvent.TextChanged,
                },
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp_compare.offset,
                    cmp_compare.exact,
                    cmp_compare.score,
                    kind_priority,
                    cmp_compare.locality,
                    cmp_compare.recently_used,
                    cmp_compare.sort_text,
                    cmp_compare.length,
                    cmp_compare.order,
                },
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp', priority = 1000 },
                { name = 'luasnip', priority = 750 }, -- For luasnip users.
            }, {
                { name = 'buffer', priority = 500, keyword_length = 2 },
            })
        })

        -- Trigger rust-analyzer flycheck after edits (debounced), not on save.
        local uv = vim.uv or vim.loop
        local ra_group = vim.api.nvim_create_augroup("RustAnalyzerFlycheck", { clear = true })
        local ra_timers = {}

        local function schedule_ra_flycheck(bufnr)
            local timer = ra_timers[bufnr]
            if not timer then
                timer = uv.new_timer()
                ra_timers[bufnr] = timer
            end

            timer:stop()
            timer:start(800, 0, vim.schedule_wrap(function()
                if not vim.api.nvim_buf_is_valid(bufnr) then
                    return
                end

                local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "rust_analyzer" })
                if #clients == 0 then
                    return
                end

                local params = {
                    textDocument = vim.lsp.util.make_text_document_params(bufnr),
                }
                local buf_notify = vim.lsp.buf_notify or vim.lsp.util.buf_notify
                if buf_notify then
                    buf_notify(bufnr, "rust-analyzer/runFlycheck", params)
                end
            end))
        end

        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
            group = ra_group,
            pattern = "*.rs",
            callback = function(args)
                if not vim.bo[args.buf].modified then
                    return
                end
                schedule_ra_flycheck(args.buf)
            end,
        })

        vim.api.nvim_create_autocmd("BufWipeout", {
            group = ra_group,
            pattern = "*.rs",
            callback = function(args)
                local timer = ra_timers[args.buf]
                if timer then
                    timer:stop()
                    timer:close()
                    ra_timers[args.buf] = nil
                end
            end,
        })

        -- Setup nvim-autopairs
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt", "vim" },
            check_ts = true, -- Enable treesitter integration for better context checking
            fast_wrap = {},  -- Optional fast wrapping with `<M-e>`
        })

        -- Integrate nvim-cmp with nvim-autopairs
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
