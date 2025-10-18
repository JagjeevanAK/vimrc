return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 20,
          --  open_mapping = [[<leader>t]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })

        -- Set keymaps for terminal
        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            -- Exit terminal mode
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)

            -- Window navigation - exit terminal mode first, then navigate
            vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
            vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
            vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
            vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)

            -- Window command mode
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- Apply keymaps to toggleterm terminals only
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

        -- Terminal keymaps
        vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal Float" })
        vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Terminal Horizontal" })
        vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Terminal Vertical" })
    end,
}
