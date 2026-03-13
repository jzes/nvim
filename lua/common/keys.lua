local M = {}

local DESC_PREFIX = "->"
local LEADER_KEY = " "

function M.map()
  vim.g.mapleader = LEADER_KEY
  vim.g.maplocalleader = LEADER_KEY
end

function M.signDesc(desc)
  return DESC_PREFIX .. desc
end

M.NORMAL_MODE = "n"
M.VISUAL_MODE = "v"
M.LEADER_KEY = "<leader>"

function M.buildDesc(descText)
  return { desc = descText }
end

function M.mapNormalMode(keys, func, desc)
  vim.keymap.set(
    M.NORMAL_MODE,
    keys,
    func,
    {
      desc = M.signDesc(desc)
    }
  )
end

function M.mapNormalModeToBuffer(keys, func, desc, buferNumber)
  vim.keymap.set(
    M.NORMAL_MODE,
    keys,
    func,
    {
      buffer = buferNumber,
      desc = M.signDesc(desc)
    }
  )
end

function M.map_navigation_keys()
  M.mapNormalMode("<c-k>", ":wincmd k<CR>", "Move to upper window")
  M.mapNormalMode("<c-j>", ":wincmd j<CR>", "Move to lower window")
  M.mapNormalMode("<c-h>", ":wincmd h<CR>", "Move to left window")
  M.mapNormalMode("<c-l>", ":wincmd l<CR>", "Move to right window")
end

return M
