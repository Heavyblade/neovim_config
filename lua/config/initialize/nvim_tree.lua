vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "s", action = "vsplit" },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})
