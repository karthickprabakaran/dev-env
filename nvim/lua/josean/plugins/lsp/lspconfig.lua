return {

  -- LSP Configs
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- on_attach function to map keys after LSP attaches
      local on_attach = function(client, bufnr)
        local buf_set_keymap = function(mode, lhs, rhs, opts)
          opts = opts or { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- LSP keymaps
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")        -- Hover
        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")   -- Go to definition
        buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>") -- Signature help
      end

      -- HTML with JSX/TSX support
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "javascriptreact", "typescriptreact", "tsx" },
      })

      -- CSS
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- TypeScript / JavaScript
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Optional: Emmet for JSX/HTML expansions
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- Treesitter with autotag
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
        },
        highlight = { enable = true },
        autotag = { enable = true },
      })
    end,
  },

  -- Auto-close tags in JSX/HTML
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
}
