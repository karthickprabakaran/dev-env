return {
  {
    "rmehri01/onenord.nvim",
    name = "onenord",
    lazy = false,
    priority = 1000,
    config = function()
      require("onenord").setup({
        borders = true,
        fade_nc = false,
        style = "dark", -- or "light"
        disable = {
          background = true, -- 🟢 enables transparency
        },
        custom_highlights = {},
      })

      vim.cmd("colorscheme onenord")

      -- Optional: Force transparent backgrounds for more UI groups
      local hl = vim.api.nvim_set_hl
      local groups = {
        "Normal", "NormalNC", "NormalFloat", "EndOfBuffer",
        "FloatBorder", "VertSplit", "WinSeparator",
        "CursorLine", "CursorLineNr", "LineNr",
        "SignColumn", "StatusLine", "TabLine", "TabLineFill", "TabLineSel",
        "TelescopeNormal", "TelescopeBorder",
        "TelescopePromptNormal", "TelescopePromptBorder",
        "TelescopeResultsNormal", "TelescopeResultsBorder",
        "TelescopePreviewNormal", "TelescopePreviewBorder",
        "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb",
        "FloatTitle", "LspFloatWinNormal", "NormalFloat",
        "DiagnosticFloatingError", "DiagnosticFloatingHint",
        "DiagnosticFloatingWarn", "DiagnosticFloatingInfo",
        "WhichKeyFloat",
        "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeVertSplit",
      }

      for _, group in ipairs(groups) do
        hl(0, group, { bg = "NONE", ctermbg = "NONE" })
      end
    end,
  },
  }
