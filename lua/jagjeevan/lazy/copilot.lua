return{
  {
    'github/copilot.vim',
    enabled = true, -- To disable copilot for now use arg false
    config = function()
      vim.g.copilot_no_tab_map = true
      -- Copilot keymaps
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Accept Copilot suggestion
    end
  }
}
