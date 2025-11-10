M = {}

function M.setCursorHighlight()
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

return M
