return { 
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })

            -- Trouble (diagnostics) navigation keymaps
            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end) -- Toggle trouble diagnostics window

            vim.keymap.set("n", "[t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end) -- Jump to next trouble item

            vim.keymap.set("n", "]t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end) -- Jump to previous trouble item

        end
    },
}
