
return {
    "mbbill/undotree",

    config = function() 
        -- Undo tree visualization
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- Toggle undo tree window
    end
}

