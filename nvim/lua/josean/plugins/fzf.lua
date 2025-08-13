return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        width = 0.9,
        height = 0.9,
        row = 0.05,
        col = 0.05,
        preview = { default = "bat" },
      },
      files = {
        -- Default exclusions
        fd_opts = [[--type f --hidden --follow 
          --exclude .git 
          --exclude node_modules 
          --exclude Library 
          --exclude Applications 
          --exclude Pictures 
          --exclude Movies 
          --exclude Music]],
      },
    })

    -- <leader>fe → Search all files starting from /Users/karthick
    vim.keymap.set("n", "<leader>fe", function()
      fzf.files({
        prompt = "Search My Files > ",
        cmd = "fd . /Users/karthick --type f --hidden --follow --exclude .git --exclude node_modules --exclude Library --exclude Applications --exclude Pictures --exclude Movies --exclude Music",
      })
    end, { desc = "Fuzzy find files in home folder" })
  end,
}
