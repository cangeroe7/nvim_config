return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
--				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.formatting.black,
				--null_ls.builtins.diagnostics.pylint,
				--null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown", "graphql" }
        }),
				--require("none-ls.diagnostics.ruff"),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
