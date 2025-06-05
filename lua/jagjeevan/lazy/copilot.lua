return{
  {
    'github/copilot.vim',
    enabled = false, -- Disable copilot for now
    config = function()
      vim.g.copilot_no_tab_map = true
      -- Copilot keymaps
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Accept Copilot suggestion
    end
  }
}