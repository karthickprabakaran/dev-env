return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    local transparent = true -- set to true if you would like to enable transparency
    
    require("vscode").setup({
      -- Alternatively set style in setup
      style = "dark", -- dark or light
      
      -- Enable transparent background
      transparent = transparent,
      
      -- Enable italic comment
      italic_comments = true,
      
      -- Underline `@markup.link.*` variants
      underline_links = true,
      
      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,
      
      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {
        vscLineNumber = "#858585",
      },
      
      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = "#FFFFFF", bg = "#000000", bold = true },
      }
    })
    
    require("vscode").load()
    
    -- Additional transparency settings for better coverage
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        local groups = {
          "Normal",
          "NormalNC", 
          "SignColumn",
          "Folded",
          "FoldColumn",
          "CursorLine",
          "CursorColumn",
          "WhichKeyFloat",
          "Pmenu",
          "PmenuSbar",
          "NormalFloat",
          "FloatBorder",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "TelescopeResultsBorder",
          "TelescopePreviewBorder",
        }
        
        for _, group in pairs(groups) do
          vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
        end
      end,
    })
  end,
}
