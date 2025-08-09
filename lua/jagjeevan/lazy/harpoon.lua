return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui  = require("harpoon.ui")

        -- Harpoon file management keymaps
        vim.keymap.set("n", "<leader>a", function() mark.add_file() end) -- Add current file to harpoon list
        vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end) -- Toggle harpoon quick menu
        vim.keymap.set("n", "<leader>hr", function() mark.rm_file() end) -- Remove current file from harpoon list
        vim.keymap.set("n", "<leader>hc", function() mark.clear_all() end) -- Clear all files from harpoon list

        -- Navigate to marked files (positions 1-4)
        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end) -- Navigate to file 1
        vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end) -- Navigate to file 2
        vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end) -- Navigate to file 3
        vim.keymap.set("n", "<C-m>", function() ui.nav_file(4) end) -- Navigate to file 4
    end
}


