-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General
  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {
        disable_filetype = { "TelescopePrompt", "norg" }
      }
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'simeji/winresizer'
  use {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup()
    end
  }
  use 'ThePrimeagen/harpoon'
  use 'tpope/vim-surround'
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {}
    end
  }

  -- Colors
  use {
    'folke/tokyonight.nvim',
    branch = 'main',
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
      })
    end
  }
  use "rebelot/kanagawa.nvim"

  -- Git
  use 'cohama/agit.vim'
  use { 'airblade/vim-gitgutter', branch = 'main' }
  use 'tpope/vim-fugitive'
  use "sindrets/diffview.nvim"

  -- UI
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.initialize.lualine')
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('config.initialize.nvim_tree')
    end,
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {
    'SmiteshP/nvim-navic',
    config = function()
      require('config.initialize.navic')
    end,
    requires = 'neovim/nvim-lspconfig',
  }
  -- Languages
  use 'fatih/vim-go'
  use 'elzr/vim-json'
  use 'vim-test/vim-test'
  use 'voldikss/vim-floaterm'

  -- Gist vim
  use 'mattn/vim-gist'
  use 'mattn/webapi-vim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('config.initialize.telescope')
    end,
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "mason-tool-installer.nvim",
    },
    config = function()
      require("config.lsp").setup()
    end,
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require("config.initialize.treesitter")
    end,
    requires = { "nvim-treesitter/playground" }
  }

  use {
    'tami5/lspsaga.nvim',
    config = function()
      require('lspsaga').init_lsp_saga()
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp").setup()
    end,
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        config = function()
          require("config.luasnip").setup()
        end,
      },
      "rafamadriz/friendly-snippets",
    },
    disable = false,
  }

  use 'folke/which-key.nvim'
  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {}
    end,
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  }

  use({
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  })

  use({
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        cd_type = "global",
        hooks = {
          open = { "Telescope find_files" },
        }
      })
    end,
  })

  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        chat = {
          keymaps = {
            close = { "jk", "kj", "<Esc>" },
            yank_last = "<C-y>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            toggle_settings = "<C-o>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
          },
        },
        popup_input = {
          submit = "<C-s>",
        },
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end)
