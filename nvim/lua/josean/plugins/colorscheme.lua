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
        disable = {
          background = true, -- Enables transparent background
        },
      })

      vim.cmd("colorscheme onenord")

      local hl = vim.api.nvim_set_hl

      -- 🌌 General background transparency
      hl(0, "Normal", { bg = "NONE" })
      hl(0, "NormalNC", { bg = "NONE" })
      hl(0, "NormalFloat", { bg = "NONE" })
      hl(0, "FloatBorder", { bg = "NONE" })
      hl(0, "WinSeparator", { bg = "NONE" })
      hl(0, "VertSplit", { bg = "NONE" })

      -- 🔭 Telescope transparency
      hl(0, "TelescopeNormal", { bg = "NONE" })
      hl(0, "TelescopeBorder", { bg = "NONE" })
      hl(0, "TelescopePromptNormal", { bg = "NONE" })
      hl(0, "TelescopePromptBorder", { bg = "NONE" })
      hl(0, "TelescopeResultsNormal", { bg = "NONE" })
      hl(0, "TelescopeResultsBorder", { bg = "NONE" })
      hl(0, "TelescopePreviewNormal", { bg = "NONE" })
      hl(0, "TelescopePreviewBorder", { bg = "NONE" })

      -- 🎯 nvim-cmp (completion menu) transparency
      hl(0, "Pmenu", { bg = "NONE" })
      hl(0, "PmenuSel", { bg = "NONE" })
      hl(0, "PmenuThumb", { bg = "NONE" })
      hl(0, "PmenuSbar", { bg = "NONE" })

      -- Optional: for floating LSP popups
      hl(0, "FloatTitle", { bg = "NONE" })
      hl(0, "LspFloatWinNormal", { bg = "NONE" }) -- sometimes used in LSP UIs
    end,
  },
}
