return {
  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html", "cssls", "tsserver", "emmet_ls",
          "clangd", "jdtls", "pylsp", "gopls", "intelephense",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },

  -- Core LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      "ray-x/lsp_signature.nvim",
      "kosayoda/nvim-lightbulb",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local buf_set_keymap = function(mode, lhs, rhs, opts)
          opts = opts or { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Keymaps
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
        buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

        -- Signature help (like VSCode parameter hints)
        require("lsp_signature").on_attach({
          bind = true,
          hint_enable = true,
          handler_opts = { border = "rounded" },
        }, bufnr)

        -- Code action lightbulb
        require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
      end

      -- Diagnostics config (cleaner look)
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        float = { border = "rounded" },
        update_in_insert = false,
      })

      -- Servers
      local servers = {
        html = {},
        cssls = {},
        tsserver = {},
        emmet_ls = {
          filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
          init_options = {
            html = { options = { ["bem.enabled"] = true } },
          },
        },
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
        jdtls = {},
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { ignore = { "W391" }, maxLineLength = 100 },
              },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              analyses = { unusedparams = true },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
        intelephense = {
          settings = { intelephense = { files = { maxSize = 1000000 } } },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
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
      "onsails/lspkind.nvim", -- VSCode-like icons
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
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
          "html", "css", "javascript", "typescript", "tsx",
          "c", "cpp", "java", "python", "go", "php", "lua",
          "json", "yaml", "markdown",
        },
        highlight = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Auto-close tags
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "tsx" },
    config = function() require("nvim-ts-autotag").setup() end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup({}) end,
  },

  -- Trouble (Problems panel like VSCode)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup({})
    end,
  },
}
