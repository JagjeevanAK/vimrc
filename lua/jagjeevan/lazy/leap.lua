return {
    "ggandor/leap.nvim",
    config = function()
        -- Set up leap keymaps (replaces deprecated add_default_mappings)
        vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
        vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
        -- Optional: customize leap highlighting
        vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end
}
