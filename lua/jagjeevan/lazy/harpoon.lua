return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui  = require("harpoon.ui")

        -- Harpoon file management keymaps
        vim.keymap.set("n", "<leader>a", function() mark.add_file() end) -- Add current file to harpoon list
        vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end) -- Toggle harpoon quick menu

        -- Navigate to marked files (positions 1-4)
        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end) -- Navigate to file 1
        vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end) -- Navigate to file 2
        vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end) -- Navigate to file 3
        vim.keymap.set("n", "<C-m>", function() ui.nav_file(4) end) -- Navigate to file 4
        
        -- Replace marked files (positions 1-4)
        vim.keymap.set("n", "<leader><C-h>", function() mark.replace_file(1) end) -- Replace file 1 with current
        vim.keymap.set("n", "<leader><C-j>", function() mark.replace_file(2) end) -- Replace file 2 with current
        vim.keymap.set("n", "<leader><C-n>", function() mark.replace_file(3) end) -- Replace file 3 with current
        vim.keymap.set("n", "<leader><C-m>", function() mark.replace_file(4) end) -- Replace file 4 with current
    end
}


