return  {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        -- File finding and searching keymaps
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Find files in project
        vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- Find git-tracked files
        vim.keymap.set('n', '<leader>pus', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end) -- Search for word under cursor
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end) -- Search for WORD under cursor (including special chars)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end) -- Search for custom input string
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {}) -- Search help documentation
    end
}

