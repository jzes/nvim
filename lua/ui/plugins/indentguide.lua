local M = {
  'saghen/blink.indent',
  config = function()
    local indent = require('blink.indent')
    vim.keymap.set('n', '<c-I>', function() indent.enable(not indent.is_enabled()) end,
      { desc = 'Toggle indent guides' })
  end,

}

return M
