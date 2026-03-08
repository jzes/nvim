local M = {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitlinker').setup()
  end

}


return M
