require("jagjeevan.set")
require("jagjeevan.remap")
require("jagjeevan.lazy_init")
-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local JagJeevanGroup = augroup('JagJeevan', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

-- Add any additional keymaps here
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = JagJeevanGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = JagJeevanGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        -- LSP Navigation keymaps
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- Go to definition
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts) -- Show hover documentation
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) -- Search workspace symbols
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts) -- Show diagnostics in floating window
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts) -- Show code actions
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts) -- Show references
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts) -- Rename symbol
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts) -- Show signature help in insert mode
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts) -- Go to next diagnostic
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts) -- Go to previous diagnostic
    end
})

-- Enable line wrapping for markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc"
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
