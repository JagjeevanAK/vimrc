-- Alternative terminal plugin - more minimal and focused
-- Uncomment this if you prefer FTerm over ToggleTerm

return {
    -- 'numToStr/FTerm.nvim',
    -- config = function()
    --     require'FTerm'.setup({
    --         border = 'double',
    --         dimensions  = {
    --             height = 0.9,
    --             width = 0.9,
    --         },
    --     })

    --     -- Terminal keymaps similar to undotree style
    --     vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
    --     vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    -- end
}
