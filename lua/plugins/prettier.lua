return {
	"MunifTanjim/prettier.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvimtools/none-ls.nvim" },
	config = function()
		require("prettier").setup({
			bin = "prettierd", -- or 'prettierd' for faster performance
			filetypes = {
				"javascript",
        "javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"scss",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
			},
		})
	end,
}
