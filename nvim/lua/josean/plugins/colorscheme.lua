return {
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = true,
        bold_keywords = true,
        italic = {
          comments = true,
        },
        override = {
          -- Add vibrancy by adjusting colors
          Keyword = { fg = "#81A1C1", bold = true },     -- brighter blue
          Function = { fg = "#8FBCBB" },                  -- teal
          String = { fg = "#A3BE8C" },                    -- green
          Constant = { fg = "#D08770" },                  -- orange
          Type = { fg = "#B48EAD" },                      -- purple
          -- Transparent background
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          Pmenu = { bg = "NONE" },
        },
      })

      vim.cmd("colorscheme nordic")

      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi FloatBorder guibg=NONE ctermbg=NONE
        hi NormalFloat guibg=NONE ctermbg=NONE
        hi Pmenu guibg=NONE ctermbg=NONE
      ]])
    end,
  },
}
