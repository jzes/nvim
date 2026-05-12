return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- obrigatório
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- instala parsers
    ts.install({
      "lua",
      "vim",
      "vimdoc",
      "json",
      "http",
      "go",
      "rust",
      "javascript",
      "typescript",
    })

    -- ativa treesitter automaticamente por filetype
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- highlight
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
