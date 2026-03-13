local keys = require("common.keys")

local fzfLua = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
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
      function()
        require("fzf-lua").grep_project()
      end,
      keys.buildDesc(keys.signDesc("FZF : Search in Files")))

    vim.keymap.set(
      keys.NORMAL_MODE,
      keys.LEADER_KEY .. keys.LEADER_KEY,
      "<cmd>FzfLua keymaps<CR>->",
      keys.buildDesc(keys.signDesc("FZF : Keymaps")))
  end,
  opts = {}
}
return fzfLua
