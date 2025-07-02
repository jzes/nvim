--local cmp = require("cmp")


local autoCmp = {}

function autoCmp.handleTab(fallback)
    if autoCmp.cmp.visible() then
        autoCmp.cmp.select_next_item()
        return
    end
    fallback()
end

function autoCmp.handleShiftTab(fallback)
    if autoCmp.cmp.visible() then
        autoCmp.cmp.select_prev_item()
        return
    end
    fallback()
end

function autoCmp.getCMPMappings()
    return autoCmp.cmp.mapping.preset.insert({
        ["<C-Space>"] = autoCmp.cmp.mapping.complete(),
        ["<CR>"] = autoCmp.cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = autoCmp.cmp.mapping(autoCmp.handleTab, { "i", "s" }),
        ["<S-Tab>"] = autoCmp.cmp.mapping(autoCmp.handleShiftTab, { "i", "s" }),
    })
end

function autoCmp.getFormatting()
    return {
        format = autoCmp.lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    }
end

function autoCmp.getSources()
    return autoCmp.cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
    })
end

autoCmp.completionConfig = {autocomplete = false}
autoCmp.windowConfig = {
    completion = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
    documentation = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
}


function autoCmp.setup()
    autoCmp.cmp = require("cmp")
    autoCmp.lspkind = require("lspkind")
    autoCmp.cmp.setup({
        completion = autoCmp.completionConfig,
        window = autoCmp.windowConfig,
        mapping = autoCmp.getCMPMappings(),
        sources = autoCmp.getSources(),
        formatting = autoCmp.getFormatting(),
    })
end

return autoCmp
