return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Parsers to keep installed. The new `main` branch installs nothing by
    -- default, so list every language we actually touch here.
    require("nvim-treesitter").install({
      "lua", "vim", "vimdoc", "query",
      "python", "bash",
      "markdown", "markdown_inline",
      "javascript", "typescript", "tsx", "html", "css",
      "json", "yaml", "toml",
      "rust", "r",
      "diff", "gitcommit",
    })

    -- Highlighting and indentation are no longer automatic on the main branch.
    -- Enable them per-buffer, guarding against filetypes that have no parser
    -- (e.g. `quarto`) so we never throw on FileType.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not lang then
          return
        end
        if not pcall(vim.treesitter.start, buf, lang) then
          return
        end
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
