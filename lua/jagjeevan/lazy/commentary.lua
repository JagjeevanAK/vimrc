return {
    "tpope/vim-commentary",
    event = "VeryLazy",
    config = function()
        -- vim-commentary works out of the box
        -- gcc - comment/uncomment current line
        -- gc + motion - comment with motion
        -- gc in visual mode - comment selection
    end
}
