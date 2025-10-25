return{
  {
    'github/copilot.vim',
    enabled = true, -- To disable copilot for now use arg false
    config = function()
      -- Copilot keymaps
	  vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("\\<Tab>")', { silent = true, expr = true, script = true })
	  vim.g.copilot_no_tab_map = true
	  vim.api.nvim_set_keymap("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true })
      vim.api.nvim_set_keymap("i", "<C-]>", "<Plug>(copilot-next)", { silent = true })
    end
  }
}
