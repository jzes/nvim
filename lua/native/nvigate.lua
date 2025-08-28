local keymapper = require("native.keys")
local M = {}

function M.map_navigation_keys()
    keymapper.mapNormalMode("<c-k>", ":wincmd k<CR>", "Move to upper window")
    keymapper.mapNormalMode("<c-j>", ":wincmd j<CR>", "Move to lower window")
    keymapper.mapNormalMode("<c-h>", ":wincmd h<CR>", "Move to left window")
    keymapper.mapNormalMode("<c-l>", ":wincmd l<CR>", "Move to right window")
end

return M
