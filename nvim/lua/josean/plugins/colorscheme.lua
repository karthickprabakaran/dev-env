
return {
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = true,
        bold_keywords = false,
        italic = {
          comments = true,
          strings = false,
          keywords = false,
        },
        override = {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          Pmenu = { bg = "NONE" },
        },
      })

      vim.cmd("colorscheme nordic")

      -- Just in case: manually clear backgrounds (safe redundancy)
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
