-- Just to ensure that windows and bg has the same color
local bg_color = "#100e17"

require('kanagawa').setup({
  transparent = true,
  theme = "wave",
  colors = {
    palette = {},
    theme = {
      wave = { sumiInk1 = bg_color, sumiInk0 = bg_color },
      all = { ui = { bg_gutter = "none" } }
    }
  },
  background = {
    dark = "wave",
    light = "lotus"
  },
})
