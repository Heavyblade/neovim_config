local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {
        disable_filetype = { "TelescopePrompt", "norg", "typr" }
      }
    end
  },
  {
    'phaazon/hop.nvim',
    event = "BufEnter",
    lazy = true,
    config = function()
      require('hop').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("config.initialize.treesitter")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require("config.initialize.nvim_treesitter_textobjects")
    end
  },
  {
    'tpope/vim-surround',
    event = "InsertEnter"
  },
  { 'airblade/vim-gitgutter', branch = 'main' },
  'tpope/vim-fugitive',
  {
    'elzr/vim-json',
    lazy = true,
    ft = 'json',
  },
  {
    'vim-test/vim-test',
    lazy = true,
    ft = 'ruby',
  },
  {
    'mattn/vim-gist',
    lazy = true,
    cmd = 'Gist',
    dependencies = 'mattn/webapi-vim',
  },
  'folke/which-key.nvim',
}

require("lazy").setup(plugins, {})
