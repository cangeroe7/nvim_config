return {
  -- Mason and Mason LSPConfig to manage LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ruff", "tsserver" },  -- List LSPs you want to install
      })
    end,
  },
  -- LSP Config to integrate LSP with Neovim
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup{}  -- Add LSP server configuration here
      lspconfig.pyright.setup({
        filetypes = {"python"},
      })
    end,
  }
}

