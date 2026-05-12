return {
  "MiladGGG/neonwave.nvim",
  config = function()
    require("neonwave").setup({
      intensity = "neon",            -- 'soft' or 'neon'
      background = "dark",           -- 'light' or dark'
      transparent_background = true, -- true or false
    })
  end,
}
