local M = {}

function M.create_format_commands()
  vim.api.nvim_create_user_command("FormatWithESLint", function()
    vim.lsp.buf.code_action({
      context = { only = { "source.fixAll.eslint" } },
      apply = true,
    })
  end, {})

  vim.api.nvim_create_user_command("FormatJSON", function()
    vim.cmd("silent! %!jq .")
  end, {})
end

return M
