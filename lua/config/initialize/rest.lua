-- Load rest-nvim plugin and set up some configurations for json formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.formatprg = "jq"
  end,
})

require("rest-nvim").setup({})
