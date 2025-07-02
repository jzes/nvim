local keys = require("native.keys")

local fzfLua = {}

function fzfLua.setKeys()
    print("setup keys")
    vim.keymap.set(keys.NORMAL_MODE, keys.LEADER_KEY .. "b", "<cmd>FzfLua buffers<CR>", keys.buildDesc(keys.signDesc("FZF : Buffers")))
    vim.keymap.set(keys.NORMAL_MODE, keys.LEADER_KEY .. "ff", "<cmd>FzfLua files<CR>", keys.buildDesc(keys.signDesc("FZF : Buffers")))
    vim.keymap.set(keys.NORMAL_MODE, keys.LEADER_KEY .. "fg", "<cmd>FzfLua live_grep<CR>", keys.buildDesc(keys.signDesc("FZF : Buffers")))
end

return fzfLua
