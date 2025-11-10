local keyMapper = {}

local DESC_PREFIX = "->"
local LEADER_KEY = " "

function keyMapper.map()
    vim.g.mapleader = LEADER_KEY
    vim.g.maplocalleader = LEADER_KEY
end

function keyMapper.signDesc(desc)
    return DESC_PREFIX .. desc
end

keyMapper.NORMAL_MODE = "n"
keyMapper.LEADER_KEY = "<leader>"

function keyMapper.buildDesc(descText)
    return { desc = descText }
end

function keyMapper.mapNormalMode(keys, func, desc)
    vim.keymap.set(
        keyMapper.NORMAL_MODE,
        keys,
        func,
        {
            desc = keyMapper.signDesc(desc)
        }
    )
end

function keyMapper.mapNormalModeToBuffer(keys, func, desc, buferNumber)
    vim.keymap.set(
        keyMapper.NORMAL_MODE,
        keys,
        func,
        {
            buffer = buferNumber,
            desc = keyMapper.signDesc(desc)
        }
    )
end

return keyMapper
