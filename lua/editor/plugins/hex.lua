return {
  'RaafatTurki/hex.nvim',
  config = function()
    require('hex').setup({
      -- Optional: Set the color scheme for the hex editor
      color_scheme = 'gruvbox', -- You can choose from various color schemes

      -- Optional: Enable or disable line numbers in the hex editor
      line_numbers = true,

      -- Optional: Set the number of bytes to display per line
      bytes_per_line = 16,

      -- Optional: Enable or disable ASCII representation of bytes
      ascii_representation = true,
    })
  end
}
