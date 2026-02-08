local keys = require("native.keys")

local fzfLua = {}

local function search_in_files()
  require("fzf-lua").grep_project({
    rg_opts = table.concat({
      "--column",
      "--line-number",
      "--no-heading",
      "--color=always",
      "--smart-case",
      "--glob '!node_modules/**'",
      "--glob '!.git/**'",
      "--glob '!package-lock.json'",
      "--glob '!package.json'",
    }, " "),
  })
end

function fzfLua.setKeys()
  print("setup keys")

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "b",
    "<cmd>FzfLua buffers<CR>",
    keys.buildDesc(keys.signDesc("FZF : Buffers")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "ff",
    "<cmd>FzfLua files<CR>",
    keys.buildDesc(keys.signDesc("FZF : Files")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "fg",
    search_in_files,
    keys.buildDesc(keys.signDesc("FZF : Search in Files")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. keys.LEADER_KEY,
    "<cmd>FzfLua keymaps<CR>->",
    keys.buildDesc(keys.signDesc("FZF : Keymaps")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "ic",
    "<cmd>FzfLua lsp_incoming_calls<CR>",
    keys.buildDesc(keys.signDesc("FZF : LSP Incoming Calls")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "ca",
    "<cmd>FzfLua lsp_code_actions<CR>",
    keys.buildDesc(keys.signDesc("FZF : LSP Code Actions")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "e",
    function()
      require("fzf-lua").diagnostics_document()
    end,
    keys.buildDesc(keys.signDesc("FZF : LSP Document Diagnostics")))
  -- vim.keymap.set(
  --   keys.NORMAL_MODE,
  --   keys.LEADER_KEY .. "wd",
  --   "<cmd>FzfLua lsp_workspace_diagnostics<CR>",
  --   keys.buildDesc(keys.signDesc("FZF : LSP Document Diagnostics")))
  --
  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "fs",
    function()
      require("fzf-lua").lsp_document_symbols()
    end,
    keys.buildDesc(keys.signDesc("FZF : LSP Document Symbols")))
  --
  -- vim.keymap.set(
  --   keys.NORMAL_MODE,
  --   keys.LEADER_KEY .. "ws",
  --   "<cmd>FzfLua lsp_workspace_symbols<CR>",
  --   keys.buildDesc(keys.signDesc("FZF : LSP Document Symbols")))
end

return fzfLua
