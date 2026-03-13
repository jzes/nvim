local key_mapper = require("common.keys")

local M = {}
function M.set_keybindings(keybindings, bufnr)
  for _, keybinding in ipairs(keybindings) do
    key_mapper.mapNormalModeToBuffer(keybinding.key, keybinding.command, keybinding.desc, bufnr)
  end
end

M.keybindings = {
  {
    key = key_mapper.LEADER_KEY .. "d",
    command = function()
      require("fzf-lua").lsp_definitions()
    end,
    desc = "Go to Definition",
  },
  {
    key = key_mapper.LEADER_KEY .. "i",
    command = function()
      require("fzf-lua").lsp_implementations()
    end,
    desc = "Go to Implementation",
  },
  {
    key = key_mapper.LEADER_KEY .. "r",
    command = function()
      require("fzf-lua").lsp_references()
    end,
    desc = "Go to References",
  },
  {
    key = key_mapper.LEADER_KEY .. "k",
    command = vim.lsp.buf.hover,
    desc = "Hover Documentation",
  },
  {
    key = "<C-.>",
    command = vim.lsp.buf.signature_help,
    desc = "Signature Help",
  },
  {
    key = key_mapper.LEADER_KEY .. "rn",
    command = vim.lsp.buf.rename,
    desc = "Rename",
  },
  {
    key = key_mapper.LEADER_KEY .. "ca",
    command = function()
      require("fzf-lua").lsp_code_actions()
    end,
    desc = "Code Action",
  },
  {
    key = key_mapper.LEADER_KEY .. "e",
    command = function()
      require("fzf-lua").diagnostics_document()
    end,
    desc = "Diagnostics List",
  },
  {
    key = key_mapper.LEADER_KEY .. "fs",
    command = function()
      require("fzf-lua").lsp_document_symbols()
    end,
    desc = "Diagnostics List",
  },
  {
    key = key_mapper.LEADER_KEY .. "ic",
    command = function()
      require("fzf-lua").lsp_incoming_calls()
    end,
    desc = "Diagnostics List",
  },

}

return M
