--local cmp = require("cmp")


local M = {}

function M.handleTab(fallback)
  if M.cmp.visible() then
    M.cmp.select_next_item()
    return
  end
  fallback()
end

function M.handleShiftTab(fallback)
  if M.cmp.visible() then
    M.cmp.select_prev_item()
    return
  end
  fallback()
end

function M.getCMPMappings()
  return M.cmp.mapping.preset.insert({
    ["<C-Space>"] = M.cmp.mapping.complete(),
    ["<CR>"] = M.cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = M.cmp.mapping(M.handleTab, { "i", "s" }),
    ["<S-Tab>"] = M.cmp.mapping(M.handleShiftTab, { "i", "s" }),
  })
end

function M.getFormatting()
  return {
    format = M.lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  }
end

function M.getSources()
  return M.cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
  })
end

M.completionConfig = { autocomplete = false }
M.windowConfig = {
  completion = {
    border = "rounded",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
  },
  documentation = {
    border = "rounded",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
  },
}


function M.setup()
  M.cmp = require("cmp")
  M.lspkind = require("lspkind")
  M.cmp.setup({
    completion = M.completionConfig,
    window = M.windowConfig,
    mapping = M.getCMPMappings(),
    sources = M.getSources(),
    formatting = M.getFormatting(),
  })
end

return M
