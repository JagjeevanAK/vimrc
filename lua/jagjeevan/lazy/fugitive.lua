return {
    "tpope/vim-fugitive",
    config = function()
        -- Git status command
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git) -- Open Git status

        local JagJeevan_Fugitive = vim.api.nvim_create_augroup("JagJeevan_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = JagJeevan_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
                
                -- Git workflow keymaps (only available in fugitive buffers)
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd("Git push")
                end, opts) -- Git push

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd("Git pull --rebase")
                end, opts) -- Git pull with rebase

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts) -- Set upstream and push
                
                vim.keymap.set("n", "<leader>ga", function()
                    vim.cmd("Git add .")
                end, opts) -- Add all changes

                vim.keymap.set("n", "<leader>gc", function()
                    vim.ui.input({ prompt = "Commit message: " }, function(message)
                        if message and message ~= "" then
                            vim.cmd("Git commit -m " .. vim.fn.shellescape(message))
                        end
                    end)
                end, opts) -- Commit with message prompt
            end,
        })

        -- Git merge conflict resolution
        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>") -- Get changes from left side (target branch)
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>") -- Get changes from right side (merge branch)
    end
}
