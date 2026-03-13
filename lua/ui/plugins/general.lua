local keys = require("common.keys")

return {

  { "christoomey/vim-tmux-navigator",
    keys.map_navigation_keys()
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  }
}
