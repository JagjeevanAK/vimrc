-- Set leader key to spacebar for easy access to custom commands
vim.g.mapleader = " "

-- File Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open file explorer (netrw) in current directory

-- Clipboard operations
vim.api.nvim_set_keymap('v', 'yyy', '"+y', { noremap = true, silent = true }) -- Copy selection to system clipboard

-- Visual mode line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down and reselect
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected lines up and reselect

-- Enhanced navigation and cursor management
vim.keymap.set("n", "J", "mzJ`z") -- Join lines while keeping cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down half page and center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up half page and center cursor
vim.keymap.set("n", "n", "nzzzv") -- Next search result and center cursor
vim.keymap.set("n", "N", "Nzzzv") -- Previous search result and center cursor

-- LSP and plugin management
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>") -- Restart LSP server

-- Advanced clipboard operations (ThePrimeagen's favorites)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- Paste over selection without losing clipboard content

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- Yank to system clipboard (normal/visual mode)
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Yank entire line to system clipboard

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- Delete without affecting clipboard

-- Insert mode improvements
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>") -- Use Ctrl+C as Escape alternative

-- External tool integration
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- Open tmux sessionizer

-- Quick word hopping
vim.keymap.set("n", "<leader>w", "/\\<", {}) -- Search for words starting with... (type letters after)
vim.keymap.set("n", "<leader>W", "?\\<", {}) -- Search backwards for words starting with...

-- Code formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- Format current buffer with LSP

-- LSP keymaps for better development experience
vim.keymap.set("n", "gd", vim.lsp.buf.definition) -- Go to definition
vim.keymap.set("n", "gD", vim.lsp.buf.declaration) -- Go to declaration
vim.keymap.set("n", "gr", vim.lsp.buf.references) -- Show references
vim.keymap.set("n", "gi", vim.lsp.buf.implementation) -- Go to implementation
vim.keymap.set("n", "K", vim.lsp.buf.hover) -- Show hover information
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help) -- Show signature help
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- Rename symbol
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action) -- Show code actions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float) -- Show diagnostic in floating window
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev) -- Go to previous diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next) -- Go to next diagnostic

-- React/TypeScript specific keymaps
vim.keymap.set("n", "<leader>rf", function()
    -- Auto-fix ESLint issues
    vim.cmd("EslintFixAll")
end) -- ESLint auto-fix

vim.keymap.set("n", "<leader>ri", function()
    -- Organize imports (TypeScript)
    vim.lsp.buf.code_action({
        apply = true,
        context = {
            only = { "source.organizeImports" }
        }
    })
end) -- Organize imports

vim.keymap.set("n", "<leader>ra", function()
    -- Add missing imports (TypeScript)
    vim.lsp.buf.code_action({
        apply = true,
        context = {
            only = { "source.addMissingImports" }
        }
    })
end) -- Add missing imports

-- Quickfix and location list navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz") -- Next quickfix item and center cursor
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz") -- Previous quickfix item and center cursor
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- Next location list item and center cursor
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- Previous location list item and center cursor

-- Text manipulation and search
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Search and replace word under cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Make current file executable

-- Language-specific snippets (Go error handling)
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
) -- Insert Go error handling block

-- Configuration and plugin shortcuts
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/jagjeevan/lazy_init.lua<CR>") -- Open lazy config
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>") -- Trigger cellular automaton animation

-- Configuration reloading
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end) -- Source/reload current configuration file

