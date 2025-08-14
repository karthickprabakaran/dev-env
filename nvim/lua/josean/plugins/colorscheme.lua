return {
  {
    "AlexvZyl/nordic.nvim",
    name = "nordic",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent = {
          bg = true,
          float = true,
        },
        bold_keywords = false,
        italic_comments = true,
        bright_border = true,
        reduced_blue = true,
        swap_backgrounds = false,
        telescope = { style = "flat" },
        ts_context = { dark_background = true },
      })
      vim.cmd.colorscheme("nordic")

      -- Set custom highlight overrides
      local hl = vim.api.nvim_set_hl
      local groups = {
        "Normal", "NormalNC", "NormalFloat", "EndOfBuffer",
        "FloatBorder", "VertSplit", "WinSeparator",
        "CursorLine", "CursorLineNr", "LineNr",
        "SignColumn", "StatusLine", "TabLine", "TabLineSel", "TabLineFill",
        "TelescopeNormal", "TelescopeBorder",
        "TelescopePromptNormal", "TelescopePromptBorder",
        "TelescopeResultsNormal", "TelescopeResultsBorder",
        "TelescopePreviewNormal", "TelescopePreviewBorder",
        "Pmenu", "PmenuSbar", "PmenuThumb",
        "FloatTitle", "LspFloatWinNormal", "DiagnosticFloatingError",
        "DiagnosticFloatingHint", "DiagnosticFloatingWarn",
        "DiagnosticFloatingInfo", "WhichKeyFloat",
        "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer",
        "NvimTreeVertSplit",
      }

      for _, grp in ipairs(groups) do
        hl(0, grp, { bg = "NONE", ctermbg = "NONE" })
      end

      -- 🎨 Visual selection highlight
      hl(0, "Visual", {
        bg = "#4C566A",
        fg = "NONE",
        blend = 0,
      })

      -- ✅ Fix nvim-cmp selection highlight
      hl(0, "PmenuSel", {
        bg = "#3B4252", -- soft dark gray for selected item
        fg = "NONE",
      })
      hl(0, "PmenuSbar", { bg = "#4C566A" })
      hl(0, "PmenuThumb", { bg = "#81A1C1" })
    end,
  },
}
