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

      -- 🧊 Make Telescope UI transparent
      local hl = vim.api.nvim_set_hl
      hl(0, "TelescopeNormal", { bg = "NONE" })
      hl(0, "TelescopeBorder", { bg = "NONE" })
      hl(0, "TelescopePromptNormal", { bg = "NONE" })
      hl(0, "TelescopePromptBorder", { bg = "NONE" })
      hl(0, "TelescopeResultsNormal", { bg = "NONE" })
      hl(0, "TelescopeResultsBorder", { bg = "NONE" })
      hl(0, "TelescopePreviewNormal", { bg = "NONE" })
      hl(0, "TelescopePreviewBorder", { bg = "NONE" })
    end,
  },
}
