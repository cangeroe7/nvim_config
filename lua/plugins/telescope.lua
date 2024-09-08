
local builtin = require('telescope.builtin')

return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	}

