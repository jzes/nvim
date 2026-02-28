local keyMapper = require("utils.keyMapper")

local M = {}
function M.set_keybindings(keybindings, bufnr)
  for _, keybinding in ipairs(keybindings) do
    keyMapper.mapNormalModeToBuffer(keybinding.key, keybinding.command, keybinding.desc, bufnr)
  end
end

M.keybindings = {
  {
    key = keyMapper.LEADER_KEY .. "d",
    command = function()
      require("fzf-lua").lsp_definitions()
    end,
    desc = "Go to Definition",
  },
  {
    key = keyMapper.LEADER_KEY .. "i",
    command = function()
      require("fzf-lua").lsp_implementations()
    end,
    desc = "Go to Implementation",
  },
  {
    key = keyMapper.LEADER_KEY .. "r",
    command = function()
      require("fzf-lua").lsp_references()
    end,
    desc = "Go to References",
  },
  {
    key = keyMapper.LEADER_KEY .. "k",
    command = vim.lsp.buf.hover,
    desc = "Hover Documentation",
  },
  {
    key = "<C-.>",
    command = vim.lsp.buf.signature_help,
    desc = "Signature Help",
  },
  {
    key = keyMapper.LEADER_KEY .. "rn",
    command = vim.lsp.buf.rename,
    desc = "Rename",
  },
  {
    key = keyMapper.LEADER_KEY .. "ca",
    command = function()
      require("fzf-lua").lsp_code_actions()
    end,
    desc = "Code Action",
  },
  {
    key = keyMapper.LEADER_KEY .. "e",
    command = function()
      require("fzf-lua").diagnostics_document()
    end,
    desc = "Diagnostics List",
  },
}

return M
