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
  "rebelot/kanagawa.nvim",
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
  -- {
  --   'elzr/vim-json',
  --   lazy = true,
  --   ft = 'json',
  -- },
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
    "yetone/avante.nvim",
    event = "VeryLazy",
    enabled = true,
    version = false,
    opts = {
      -- add any opts here
    },
    build = "make",
    config = function()
      require("avante").setup({
        provider = "copilot",
        providers = {
          copilot = {
            -- model = "claude-3.7-sonnet",
            model = "gpt-4.1",
          },
          gemini = {
            model = "gemini-2.5-pro",
          },
        },
        auto_suggestions_provider = "copilot",
        windows = {
          position = "right",
          width = 40,
          input = {
            height = 10,
          },
        },
        -- system_prompt as function ensures LLM always has latest MCP server state
        -- This is evaluated for every message, even in existing chats
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ""
        end,
        -- Using function prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        config = function()
          require("render-markdown").setup()
        end,
        opts = {
          file_types = { "markdown", "Avante", "copilot-chat" },
        },
        ft = { "markdown", "Avante", "copilot-chat" },
      },
    },
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  { 'cohama/agit.vim' },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup({
        global_env = {
          OPENAI_API_KEY = os.getenv("OPENAI_API_KEY"),
        },
        workspace = {
          look_for = { ".mcphub/servers.json", ".cursor/mcp.json" },
        },
      })
    end
  },
  { "sindrets/diffview.nvim" }
}

require("lazy").setup(plugins, {})
