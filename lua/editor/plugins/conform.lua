-- Essa parte da config foi escrita por uma IA então pode não ser a melhor forma, mas é uma experiencia
local node_filetypes = {
  "javascript", "javascriptreact", "typescript", "typescriptreact",
  "json", "jsonc", "yaml", "markdown",
}

local prettier_config_files = {
  ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.yaml",
  ".prettierrc.json5", ".prettierrc.js", ".prettierrc.cjs", ".prettierrc.mjs",
  "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs", "prettier.config.ts",
}

local function has_prettier(bufnr)
  local bufpath = vim.api.nvim_buf_get_name(bufnr)
  if bufpath == "" then return false end
  local dirname = vim.fs.dirname(bufpath)

  -- standalone config file
  if vim.fs.find(prettier_config_files, { path = dirname, upward = true, limit = 1 })[1] then
    return true
  end

  -- "prettier" key inside package.json
  local pkg = vim.fs.find("package.json", { path = dirname, upward = true, limit = 1 })[1]
  if pkg then
    local ok, lines = pcall(vim.fn.readfile, pkg)
    if ok and table.concat(lines, ""):find('"prettier"') then
      return true
    end
  end

  -- prettier binary inside local node_modules
  if pkg then
    local prettier_bin = vim.fs.dirname(pkg) .. "/node_modules/.bin/prettier"
    if vim.uv.fs_stat(prettier_bin) then
      return true
    end
  end

  return false
end

local M = {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if vim.tbl_contains(node_filetypes, ft) and not has_prettier(bufnr) then
          return nil
        end
        return { timeout_ms = 1000, lsp_fallback = false }
      end,
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        python = { "black" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    })
  end
}
return M
