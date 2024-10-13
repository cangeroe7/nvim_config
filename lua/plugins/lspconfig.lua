return {
	-- Mason and Mason LSPConfig to manage LSP servers, linters, and formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = { "black", "ruff", "mypy" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "gopls" }, -- List LSPs you want to install
			})
		end,
	},
	-- LSP Config to integrate LSP with Neovim
	{
		"neovim/nvim-lspconfig",
		config = function()
      local on_attach = require("cmp_nvim_lsp").on_attach
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			})
		end,
	},
}
