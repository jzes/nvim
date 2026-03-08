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

function M.set_cursor_highlight()
  -- ide like highlight when stopping cursor
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
    desc = "Highlight references under cursor",
    callback = function()
      -- Only run if the cursor is not in insert mode
      if vim.fn.mode() ~= "i" then
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local supports_highlight = false
        for _, client in ipairs(clients) do
          if client.server_capabilities.documentHighlightProvider then
            supports_highlight = true
            break -- Found a supporting client, no need to check others
          end
        end

        -- 3. Proceed only if an LSP is active AND supports the feature
        if supports_highlight then
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        end
      end
    end,
  })
end

function M.set_highlight_yank()
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    desc = "Highlight yanked text",
    callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
  })
end

return M
