return{
  {
    'github/copilot.vim',
    enabled = true, -- To disable copilot for now use arg false
    config = function()
      -- Copilot keymaps
      vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true }) -- Accept Copilot suggestion with Tab
    end
  }
}
