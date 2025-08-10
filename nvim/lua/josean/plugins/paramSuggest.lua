return {
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        hint_enable = true,          -- inline hints
        hint_prefix = "💡 ",
        floating_window = false,     -- set to true for popup hints
        handler_opts = { border = "rounded" },
      })

      -- Attach to all LSP clients automatically
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          require("lsp_signature").on_attach({}, bufnr)
        end,
      })
    end,
  },
}
