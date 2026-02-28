local keys = require "native.keys"

local function harpoon()
  return require("harpoon")
end

local M = {}

function M.setup()
  require("harpoon").setup({
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  })
end

function M.listMarks()
  local harp = harpoon()
  local marks = {}

  for i, mark in ipairs(harp:list().items) do
    table.insert(
      marks,
      string.format("%s:%d |%d", mark.value, mark.context.row, i)
    )
  end

  local fzf = require("fzf-lua")
  fzf.fzf_exec(marks, {
    prompt = "Harpoon ❯ ",
    previewer = "builtin",
    actions = {
      ["default"] = function(selected)
        local index = tonumber(selected[1]:match("|%s*(%d+)$"))

        -- vim.notify(string.format("index:%s", index))
        if index then
          harp:list():select(index)
        end
      end,
    }
  })
end

function M.setKeys()
  local harp = harpoon()

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "hf",
    M.listMarks,
    keys.buildDesc(keys.signDesc("HARPOON : add mark")))

  vim.keymap.set(
    keys.NORMAL_MODE,
    keys.LEADER_KEY .. "ha",
    function()
      harp:list():add()
    end,
    keys.buildDesc(keys.signDesc("HARPOON : add mark")))

  vim.keymap.set(keys.NORMAL_MODE,
    keys.LEADER_KEY .. ".",
    function()
      harp:list():next()
    end,
    keys.buildDesc(keys.signDesc("HARPOON : proximo mark")))

  vim.keymap.set(keys.NORMAL_MODE,
    keys.LEADER_KEY .. ",",
    function()
      harp:list():prev()
    end,
    keys.buildDesc(keys.signDesc("HARPOON : mark anterior")))
end

return M
