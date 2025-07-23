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
          -- 💡 Vibrant syntax colors
          Keyword = { fg = "#81A1C1", bold = true },
          Function = { fg = "#8FBCBB" },
          String = { fg = "#A3BE8C" },
          Constant = { fg = "#D08770" },
          Type = { fg = "#B48EAD" },

          -- 🎨 Transparency and visual fixes
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          Pmenu = { bg = "NONE" },

          -- 🔢 Line numbers and signs
          LineNr = { fg = "#4C566A", bg = "NONE" },
          CursorLineNr = { fg = "#88C0D0", bg = "NONE" },
          SignColumn = { bg = "NONE" },

          -- 📌 CursorLine (optional)
          CursorLine = { bg = "#2E3440" }, -- Subtle highlight

          -- 🔲 Visual selection
          Visual = { bg = "#434C5E" }, -- Soft blue highlight
        },
      })

      vim.cmd("colorscheme nordic")
    end,
  },
}
