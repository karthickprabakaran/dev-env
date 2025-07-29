return {
  {
    "rmehri01/onenord.nvim",
    name = "onenord",
    lazy = false,
    priority = 1000,
    config = function()
      require("onenord").setup({
        theme = "dark",              -- "dark" or "light"
        borders = true,              -- Split and float window borders
        fade_nc = false,             -- Dim inactive windows
        styles = {
          comments = "italic",
          strings = "NONE",
          keywords = "bold",
          functions = "bold",
          variables = "NONE",
        },
        disable = {
          background = true,         -- Enable transparency
          cursorline = false,
          eob_lines = true           -- Hide ~ lines at end of buffer
        },
        custom_highlights = {
          -- Optional: override highlights here
          Normal = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          Pmenu = { bg = "NONE" },
        },
      })

      vim.cmd("colorscheme onenord")
    end,
  },
}
