local keyMapper = require("common.keys")

local M = {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    require("bufferline").setup({
      options = {
        mode = "buffers", -- ou "tabs" se quiser tab real
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        separator_style = "thin", -- ou "thin", "padded_slant", etc.
        offsets = {
          {
            filetype = "NvimTree",
            text = "󰉋 " .. project_name,
            highlight = "Directory",
            text_align = "left",
          },
        }
      },
    })

    keyMapper.mapNormalModeToBuffer("<S-l>", "<cmd>BufferLineCycleNext<CR>", "Proxima tab")
    keyMapper.mapNormalModeToBuffer("<S-h>", "<cmd>BufferLineCyclePrev<CR>", "Tab anterior")
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "c", "<cmd>bd<CR>", "Fecha a tab")
  end
}

return M
