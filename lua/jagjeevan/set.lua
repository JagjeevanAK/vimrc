vim.opt.guicursor = ""

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

local function max_float_width()
    return math.max(60, math.floor(vim.o.columns * 0.6))
end

-- Enable filetype detection, plugins, and indentation
vim.cmd("filetype plugin indent on")

-- Configure diagnostics to show errors inline automatically
vim.diagnostic.config({
    -- Hybrid diagnostics:
    -- - non-cursor lines: short inline virtual text
    -- - cursor line: full wrapped virtual lines
    virtual_text = {
        prefix = function(diagnostic)
            local cursor_lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
            local start_lnum = diagnostic.lnum or -1
            local end_lnum = diagnostic.end_lnum or start_lnum
            if cursor_lnum >= start_lnum and cursor_lnum <= end_lnum then
                return ""
            end
            return "●"
        end,
        spacing = 2,
        source = "if_many",
        format = function(diagnostic)
            local cursor_lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
            local start_lnum = diagnostic.lnum or -1
            local end_lnum = diagnostic.end_lnum or start_lnum
            if cursor_lnum >= start_lnum and cursor_lnum <= end_lnum then
                return ""
            end
            local one_line = (diagnostic.message or ""):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
            local max_len = math.max(40, math.floor(vim.o.columns * 0.35))
            if #one_line > max_len then
                return one_line:sub(1, max_len - 1) .. "…"
            end
            return one_line
        end,
    },
    virtual_lines = {
        current_line = true,
        source = "if_many",
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
        wrap = true,
        max_width = max_float_width(),
    },
})

local diagnostic_cursor_refresh_group = vim.api.nvim_create_augroup("DiagnosticCursorRefresh", { clear = true })
vim.api.nvim_create_autocmd({ "CursorMoved", "BufEnter" }, {
    group = diagnostic_cursor_refresh_group,
    callback = function(args)
        local bufnr = args.buf or vim.api.nvim_get_current_buf()
        if not vim.api.nvim_buf_is_valid(bufnr) then
            return
        end
        if vim.bo[bufnr].buftype ~= "" then
            return
        end
        -- Re-render diagnostics so cursor-line/full and non-cursor/short views stay accurate.
        vim.diagnostic.show(nil, bufnr)
    end,
})

local original_open_float = vim.diagnostic.open_float
vim.diagnostic.open_float = function(bufnr, opts)
    opts = opts or {}
    opts.wrap = true
    opts.max_width = opts.max_width or max_float_width()
    return original_open_float(bufnr, opts)
end

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true

local wrap_group = vim.api.nvim_create_augroup("MainEditorWrap", { clear = true })
local function update_main_editor_wrap()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local non_float_wins = {}

    for _, win in ipairs(wins) do
        if vim.api.nvim_win_get_config(win).relative == "" then
            table.insert(non_float_wins, win)
        end
    end

    local should_wrap = #non_float_wins == 1
    for _, win in ipairs(non_float_wins) do
        local bufnr = vim.api.nvim_win_get_buf(win)
        if vim.bo[bufnr].buftype == "" then
            vim.wo[win].wrap = should_wrap
            vim.wo[win].linebreak = true
            vim.wo[win].breakindent = should_wrap
        end
    end
end

vim.api.nvim_create_autocmd({ "VimEnter", "WinNew", "WinClosed", "BufWinEnter", "TabEnter" }, {
    group = wrap_group,
    callback = update_main_editor_wrap,
})

local uv = vim.uv or vim.loop
local base_python_env = {
    path = vim.env.PATH or "",
    virtual_env = vim.env.VIRTUAL_ENV or "",
}

local function path_is_dir(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == "directory"
end

local function parent_dir(path)
    local parent = vim.fs.dirname(path)
    if not parent or parent == path then
        return nil
    end
    return parent
end

local function collect_venv_chain(start_dir)
    local chain = {}
    local dir = start_dir
    while dir do
        local venv = dir .. "/.venv"
        if path_is_dir(venv) then
            table.insert(chain, venv)
        end
        dir = parent_dir(dir)
    end
    return chain
end

local function split_path(path)
    local parts = {}
    for part in string.gmatch(path or "", "([^:]+)") do
        table.insert(parts, part)
    end
    return parts
end

local function unique_path(parts)
    local seen = {}
    local out = {}
    for _, part in ipairs(parts) do
        if part ~= "" and not seen[part] then
            seen[part] = true
            table.insert(out, part)
        end
    end
    return out
end

local function mason_bin_path()
    return vim.fn.stdpath("data") .. "/mason/bin"
end

local function switch_python_env_for_buf(bufnr)
    if not vim.api.nvim_buf_is_valid(bufnr) then
        return
    end
    if vim.bo[bufnr].buftype ~= "" then
        return
    end

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local start_dir = ""
    if bufname ~= "" then
        start_dir = vim.fs.dirname(bufname)
    else
        start_dir = uv.cwd() or ""
    end
    if start_dir == "" then
        return
    end

    local venv_chain = collect_venv_chain(start_dir)
    local chain_key = table.concat(venv_chain, ";")
    if vim.g.active_python_venv_chain == chain_key then
        return
    end
    vim.g.active_python_venv_chain = chain_key

    local updated_path = {}
    for _, venv in ipairs(venv_chain) do
        table.insert(updated_path, venv .. "/bin")
    end
    local mason_bin = mason_bin_path()
    if path_is_dir(mason_bin) then
        table.insert(updated_path, mason_bin)
    end
    for _, base_part in ipairs(split_path(base_python_env.path)) do
        table.insert(updated_path, base_part)
    end
    vim.env.PATH = table.concat(unique_path(updated_path), ":")

    if venv_chain[1] then
        vim.env.VIRTUAL_ENV = venv_chain[1]
    elseif base_python_env.virtual_env ~= "" then
        vim.env.VIRTUAL_ENV = base_python_env.virtual_env
    else
        vim.env.VIRTUAL_ENV = nil
    end
end

local python_venv_group = vim.api.nvim_create_augroup("PythonVenvSwitch", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "DirChanged" }, {
    group = python_venv_group,
    callback = function(args)
        local bufnr = args.buf or vim.api.nvim_get_current_buf()
        switch_python_env_for_buf(bufnr)
    end,
})

vim.api.nvim_create_user_command("VenvInfo", function()
    local active = vim.env.VIRTUAL_ENV or "none"
    vim.notify("VIRTUAL_ENV: " .. active)
end, { desc = "Show current active Python virtualenv" })

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
