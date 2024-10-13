require("config.lazy")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd.colorscheme("catppuccin")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.undofile = true

vim.opt.ignorecase = true

vim.opt.smartcase = true

vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
