return {
  -- Mason and Mason LSPConfig to manage LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "black", "mypy", "isort", "flake8", "pylint", "debugpy" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "cssls",
          "html",
          "jsonls",
          "emmet_language_server",
          "tailwindcss",
        },
      })
    end,
  },
  -- LSP Config to integrate LSP with Neovim (nvim 0.11+ native API)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Set up keymaps when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { noremap = true, silent = true, buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        end,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportPossiblyUnboundVariable = "none",
              },
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("emmet_language_server", {
        capabilities = capabilities,
        filetypes = { "css", "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "scss" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "ts_ls",
        "emmet_language_server",
        "tailwindcss",
      })
    end,
  },
}
