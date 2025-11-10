M = {}

function M.setHighlightYank()
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
        desc = "Highlight yanked text",
        callback = function()
            vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
        end,
    })
end

return M
