return {
  -- Mason and Mason LSPConfig to manage LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "black", "mypy", "isort", "flake8", "pylint", "debugpy"},
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
          "gopls",
          "ts_ls",
          "cssls",
          "html",
          "jsonls",
          "emmet_language_server",
          "tailwindcss"
        }, -- List LSPs you want to install
      })
    end,
  },
  -- LSP Config to integrate LSP with Neovim
  {
    "neovim/nvim-lspconfig",
    config = function()
      --			local on_attach = require("cmp_nvim_lsp").on_attach
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportPossiblyUnboundVariable = "none",
              },
            },
          },
        },

        capabilities = capabilities,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.emmet_language_server.setup({
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

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })
    end,
  },
}
