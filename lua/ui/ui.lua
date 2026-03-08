local M = {}

M.default_signs = {
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " ",
}

function M.set_signs(signs)
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = signs.Error,
        [vim.diagnostic.severity.WARN]  = signs.Warn,
        [vim.diagnostic.severity.HINT]  = signs.Hint,
        [vim.diagnostic.severity.INFO]  = signs.Info,
      },
    },
  })
end

return M
