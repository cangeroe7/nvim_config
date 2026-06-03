return {
	"nvim-lualine/lualine.nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons", opt = true }, "catppuccin/nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-mocha",
				icons_enabled = true,
			},
		})
	end,
}
