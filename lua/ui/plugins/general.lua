local keys = require("common.keys")

return {

  -- { "christoomey/vim-tmux-navigator",
  --   keys.map_navigation_keys()
  -- },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-mini/mini.nvim' },  -- if you use the mini.nvim suite
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    config = function()
      dofile(vim.fn.expand("/home/jzes/lab/tools/vim-herdr-navigation/editor/nvim.lua"))
    end,
  }

}
