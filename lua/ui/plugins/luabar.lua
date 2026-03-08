local luabar = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto", -- usa o tema atual do Neovim (ou pode usar "catppuccin", "tokyonight", etc.)
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true, -- barra única no final da tela
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end

}

return luabar
