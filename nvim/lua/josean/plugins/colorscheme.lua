return {
  {
    "gmr458/vscode_modern_theme.nvim",
    name = "vscode_modern_theme",
    lazy = false,
    priority = 1000,
    config = function()
      -- 🧱 Theme setup with transparency
      require("vscode_modern").setup({
        transparent = true,           -- Core transparent flag
        italic_comments = true,
        disable_nvimtree_bg = true,   -- Removes nvim-tree background by default
      })

      vim.cmd("colorscheme vscode_modern")

      -- 🎨 Transparent backgrounds for all major UI components
      local hl = vim.api.nvim_set_hl
      local groups = {
        -- Core UI
        "Normal", "NormalNC", "NormalFloat", "EndOfBuffer",
        "FloatBorder", "VertSplit", "WinSeparator",
        "CursorLine", "CursorLineNr", "LineNr",
        "SignColumn", "StatusLine", "TabLine", "TabLineFill", "TabLineSel",

        -- Telescope
        "TelescopeNormal", "TelescopeBorder",
        "TelescopePromptNormal", "TelescopePromptBorder",
        "TelescopeResultsNormal", "TelescopeResultsBorder",
        "TelescopePreviewNormal", "TelescopePreviewBorder",

        -- nvim-cmp popup menu
        "Pmenu", "PmenuSel", "PmenuSbar", "PmenuThumb",

        -- LSP and floating windows
        "FloatTitle", "LspFloatWinNormal", "NormalFloat",
        "DiagnosticFloatingError", "DiagnosticFloatingHint",
        "DiagnosticFloatingWarn", "DiagnosticFloatingInfo",

        -- Key suggestion plugin (like which-key)
        "WhichKeyFloat",

        -- ✅ nvim-tree specific
        "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer", "NvimTreeVertSplit",
      }

      for _, group in ipairs(groups) do
        hl(0, group, { bg = "NONE", ctermbg = "NONE" })
      end
    end,
  },
}
