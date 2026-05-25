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

function canUseCopilot()
  local currentDirectory          = vim.fn.getcwd()
  vim.g.copilot_workspace_folders = { currentDirectory }

  return currentDirectory ~= "/Users/cvasquez/rails/advent_2024" and
      currentDirectory ~= "/Users/cvasquez/rails/spreedly/core"
end

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
    'goolord/alpha-nvim',
    config = function()
      require("config.initialize.alpha-nvim")
    end
  },
  {
    'smoka7/hop.nvim',
    event = "BufEnter",
    lazy = true,
    config = function()
      require('hop').setup()
    end
  },
  'ThePrimeagen/harpoon',
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = true,
    config = function()
      require("config.initialize.nvim_treesitter_textobjects")
    end
  },
  {
    'tpope/vim-surround',
    event = "InsertEnter"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
      })
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('config.initialize.kanagawa')
    end
  },
  { 'airblade/vim-gitgutter',  branch = 'main' },
  'tpope/vim-fugitive',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.initialize.lualine')
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('config.initialize.nvim_tree')
    end,
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
  },
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    config = function()
      require('config.initialize.navic')
    end,
    dependencies = 'neovim/nvim-lspconfig',
  },
  {
    'fatih/vim-go',
    event = "VeryLazy",
    lazy = true,
    ft = 'go',
  },
  require("config.initialize.nvim_dap"),
  {
    'vim-test/vim-test'
  },
  'voldikss/vim-floaterm',
  { 'akinsho/toggleterm.nvim', version = "*",  config = true },
  {
    'mattn/vim-gist',
    lazy = true,
    cmd = 'Gist',
    dependencies = 'mattn/webapi-vim',
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function()
      require('config.initialize.telescope')
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("config.lsp").setup()
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
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
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp").setup()
    end,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "friendly-snippets" },
        config = function()
          require("config.luasnip").setup()
        end,
      },
      "rafamadriz/friendly-snippets",
    }
  },
  'folke/which-key.nvim',
  {
    'folke/trouble.nvim',
    cmd = "TroubleToggle",
    config = function()
      require('trouble').setup {}
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  {
    'pwntester/octo.nvim',
    lazy = true,
    cmd = "Octo",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("octo").setup()
    end
  },
  {
    'mistweaverco/kulala.nvim',
    lazy = true,
    opts = {
      default_view = "headers_body",
    },
    ft = 'http',
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
          },
        },
      })
    end,
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  { 'cohama/agit.vim' },
  { "sindrets/diffview.nvim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = require("config.initialize.copilot_chat").opts,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    config = function()
      require("render-markdown").setup()
    end,
    opts = {
      file_types = { "markdown", "Avante", "copilot-chat" },
      ft = { "markdown", "Avante", "copilot-chat" },
    }
  },
  {
    "eltonsst/local-review.nvim",
    config = function()
      require("local_review").setup({
        keymap = "<leader>rc",
      })
    end,
  }
}

require("lazy").setup(plugins, {})
