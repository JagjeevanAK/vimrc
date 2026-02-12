vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

-- Enable filetype detection, plugins, and indentation
vim.cmd("filetype plugin indent on")

-- Configure diagnostics to show errors inline automatically
vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- Could be '■', '▎', 'x', '●', etc.
        spacing = 4,
        source = "if_many", -- Show source if there are multiple diagnostics
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
    underline = true,
    update_in_insert = false, -- Don't show diagnostics while typing
    severity_sort = true, -- Show errors before warnings
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""

-- React/JavaScript/TypeScript specific settings
vim.api.nvim_create_augroup("ReactSettings", { clear = true })

-- Auto-format on save for JS/TS/React files
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "ReactSettings",
    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Set specific indentation for JS/TS/React files
vim.api.nvim_create_autocmd("FileType", {
    group = "ReactSettings",
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        -- Disable smartindent for these filetypes as treesitter handles indentation
        vim.opt_local.smartindent = false
        vim.opt_local.cindent = false
        vim.opt_local.autoindent = true
        vim.opt_local.indentexpr = "nvim_treesitter#indent()"
    end,
})

-- Enable spell check for markdown files (useful for documentation)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Auto-organize imports on save for TypeScript files
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "ReactSettings",
    pattern = { "*.ts", "*.tsx" },
    callback = function()
        vim.lsp.buf.code_action({
            apply = true,
            context = {
                only = { "source.organizeImports" }
            }
        })
    end,
})

