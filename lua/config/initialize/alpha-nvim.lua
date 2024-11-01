local ascii_art = {
[[      _]],
[[     ( )]],
[[      H]],
[[      H]],
[[     _H_ ]],
[[  .-'-.-'-.]],
[[ /         \]],
[[|           |]],
[[|   .-------'._]],
[[|  / /  '.' '. \]],
[[|  \ \ @   @ / / ]],
[[|   '---------'        ]],
[[|    _______|  ]],
[[|  .'-+-+-+|  ]],
[[|  '.-+-+-+|    Neovim, b'tch!]],
[[|    """""" |]],
[['-.__   __.-']],
[[     """]],
}

startify = require('alpha.themes.startify')
startify.config.layout[2] = {
  type = "text",
  val = ascii_art,
  opts = {
    hl = "Type",
    shrink_margin = false,
  },
}

require 'alpha'.setup(startify.config)
