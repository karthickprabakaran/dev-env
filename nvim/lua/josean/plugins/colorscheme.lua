return {
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = true,
        bold_keywords = false, -- More minimalist
        italic = {
          comments = true,
          strings = true, -- Subtle elegance
        },
        override = {
          -- 🌙 Warm, minimal syntax colors that complement your background
          Keyword = { fg = "#D4A574", italic = true }, -- Warm gold like your moon
          Function = { fg = "#7FB3A3" }, -- Soft teal-green, harmonious with background
          String = { fg = "#A3BE8C", italic = true }, -- Gentle green with italic
          Constant = { fg = "#D08770" }, -- Warm orange-coral
          Type = { fg = "#8A9A7B" }, -- Muted sage green
          Comment = { fg = "#5C6B73", italic = true }, -- Subtle blue-gray
          
          -- 🎨 Pure transparency for your background
          Normal = { bg = "NONE", fg = "#D8DEE9" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE", fg = "#4C566A" },
          Pmenu = { bg = "NONE" },
          PmenuSel = { bg = "#2E3440", fg = "#D8DEE9" },
          
          -- 🔢 Minimal line numbers
          LineNr = { fg = "#3B4252", bg = "NONE" }, -- Very subtle
          CursorLineNr = { fg = "#7FB3A3", bg = "NONE" }, -- Soft teal accent
          SignColumn = { bg = "NONE" },
          
          -- 📌 Subtle cursor line (optional - remove if too much)
          CursorLine = { bg = "NONE" }, -- Completely transparent
          
          -- 🔲 Minimal visual selection
          Visual = { bg = "#2E3440" }, -- Very subtle highlight
          
          -- 🌟 Status and tab lines
          StatusLine = { bg = "NONE", fg = "#7FB3A3" },
          StatusLineNC = { bg = "NONE", fg = "#4C566A" },
          TabLine = { bg = "NONE", fg = "#4C566A" },
          TabLineFill = { bg = "NONE" },
          TabLineSel = { bg = "NONE", fg = "#D4A574" },
          
          -- 🔍 Search highlights
          Search = { bg = "#3B4252", fg = "#D4A574" },
          IncSearch = { bg = "#D4A574", fg = "#2E3440" },
          
          -- 📝 Diagnostic colors (if you use LSP)
          DiagnosticError = { fg = "#BF616A" },
          DiagnosticWarn = { fg = "#D08770" },
          DiagnosticInfo = { fg = "#7FB3A3" },
          DiagnosticHint = { fg = "#8A9A7B" },
        },
      })
      vim.cmd("colorscheme nordic")
    end,
  },
}
