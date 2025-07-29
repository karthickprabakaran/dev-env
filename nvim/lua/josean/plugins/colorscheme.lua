return {
  {
    "rmehri01/onenord.nvim",
    name = "onenord",
    lazy = false,
    priority = 1000,
    config = function()
      require("onenord").setup({
        theme = "dark",
        borders = true,
        fade_nc = false,
        styles = {
          comments = "italic",
          strings = "NONE",
          keywords = "bold",
          functions = "bold",
          variables = "NONE",
        },
        disable = {
          background = true,
          cursorline = false,
          eob_lines = true
        },
        custom_highlights = {
          Normal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          Pmenu = { bg = "NONE" },

          -- Telescope transparency
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { bg = "NONE" },
          TelescopePromptNormal = { bg = "NONE" },
          TelescopePromptBorder = { bg = "NONE" },
          TelescopeResultsNormal = { bg = "NONE" },
          TelescopeResultsBorder = { bg = "NONE" },
          TelescopePreviewNormal = { bg = "NONE" },
          TelescopePreviewBorder = { bg = "NONE" },
        },
      })

      vim.cmd("colorscheme onenord")
    end,
  },
}
