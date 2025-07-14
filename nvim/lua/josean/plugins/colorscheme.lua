return {
  {
    "p00f/alabaster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Enable true color support
      vim.opt.termguicolors = true

      -- Optional: force background mode
      vim.opt.background = "dark" -- or "light"

      -- Alabaster options
      vim.g.alabaster_dim_comments = false
      vim.g.alabaster_floatborder = false

      -- Load theme
      vim.cmd("colorscheme alabaster")

      -- 🌿 Minimal Treesitter highlight overrides
      local function set_highlight(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
      end

      -- Soft contrast without distracting from code
      set_highlight("@function",  { fg = "#88C0D0", bold = false })  -- pale blue
      set_highlight("@variable",  { fg = "#ECEFF4" })                -- light gray
      set_highlight("@parameter", { fg = "#A3BE8C", italic = true }) -- soft green
      set_highlight("@property",  { fg = "#D8DEE9" })                -- light gray
      set_highlight("@keyword",   { fg = "#B48EAD", italic = true }) -- lavender
      set_highlight("@comment",   { fg = "#5c6370", italic = true }) -- dimmed
    end,
  },
}
