local formater = {}

function formater.setup()
    require("conform").setup({
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true, -- usa LSP se não houver formatter configurado
        },
        formatters_by_ft = {
            go = { "goimports", "gofmt" },
           -- lua = { "stylua" },
            python = { "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
        },
    })
end

return formater
