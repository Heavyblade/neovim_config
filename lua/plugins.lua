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
        disable_filetype = { "TelescopePrompt", "norg" }
      }
    end
  },
  {
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    config = function()
      require('Comment').setup()
    end
  },
  'simeji/winresizer',
  {
    'phaazon/hop.nvim',
    event = "InsertEnter",
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
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end
  },
  {
    'folke/tokyonight.nvim',
    branch = 'main',
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
    end
  },
  "rebelot/kanagawa.nvim",
  'cohama/agit.vim',
  { 'airblade/vim-gitgutter', branch = 'main' },
  'tpope/vim-fugitive',
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen"
  },
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
  'mattn/vim-gist',
  'mattn/webapi-vim',
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
    end
  },
  {
    'tami5/lspsaga.nvim',
    config = function()
      require('lspsaga').init_lsp_saga()
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
    branch = 'fix_429',
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
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        cd_type = "global",
        hooks = {
          open = { "Telescope find_files" },
        }
      })
    end
  },
  "github/copilot.vim",
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
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}

require("lazy").setup(plugins, {})
