return {
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Disable default Tab mapping
      vim.g.copilot_no_tab_map = true

      -- Custom keymap to accept Copilot suggestion
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        noremap = true
      })

      -- Optional: Disable Copilot for specific filetypes
      vim.g.copilot_filetypes = {
        markdown = false,
        gitcommit = false,
      }
    end,
  }
}
