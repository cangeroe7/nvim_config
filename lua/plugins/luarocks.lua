return {
  "vhyrro/luarocks.nvim",
  priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  opts = {
    rocks = { "magick" },
  },
}
