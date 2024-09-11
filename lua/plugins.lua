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

  return currentDirectory ~= "/Users/cvazquez/rails/spreedly/core" and
      currentDirectory ~= "/Users/cvazquez/rails/spreedly/id"
end

local plugins = {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {
        disable_filetype = { "TelescopePrompt", "norg" }
      }
    end
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
  'simeji/winresizer',
  {
    'phaazon/hop.nvim',
    event = "BufEnter",
    lazy = true,
    config = function()
      require('hop').setup()
    end
  },
  'ThePrimeagen/harpoon',
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
  "rebelot/kanagawa.nvim",
  {
    "cohama/agit.vim",
    cmd = "AgitFile",
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
    ft = 'go',
  },
  {
    'elzr/vim-json',
    ft = 'json',
  },
  {
    'vim-test/vim-test',
    ft = 'ruby',
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
    opts = {
      format = { timeout_ms = 2000 }
    },
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
    end
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
    "github/copilot.vim",
    enabled = canUseCopilot()
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.initialize.rest")
    end
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      local neovim_config_dir = vim.fn.stdpath("config")
      require("chatgpt").setup({
        predefined_chat_gpt_prompts = "file://" .. neovim_config_dir .. "/lua/config/prompts.csv",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },    -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
      window = {
        layout = 'float',
        title = 'Copilot Chat',
        width = 0.7, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.7,
      },
      auto_follow_cursor = false,
    },
    enabled = canUseCopilot(),
  }
}

require("lazy").setup(plugins, {})
