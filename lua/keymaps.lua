local whichkey = require "which-key"
local utils = require "utils"
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local noremap = { noremap = true }

-- General
map("n", "<SPACE>", "", {})
map("n", "q", "", {})
map("n", "s", ":HopWord<cr>", {})
map("n", "<C-p>", ":Telescope find_files<cr>", {})
map("t", "<C-\\>", ":FloatermToggle<cr>", {})
map("n", "<C-\\>", ":FloatermToggle<cr>", {})
map("n", "<Leader>rr", ":WinResizerStartResize<cr>", noremap)
map("n", "<Leader>nt", ":NvimTreeToggle<cr>", noremap)
map("n", "<leader>nf", ":NvimTreeFindFile<cr>", noremap)
map("n", "<Leader>af", ":AgitFile<cr>", noremap)
map("n", "<Leader>gs", ":Git<cr>", noremap)
map("n", "<Leader>rt", ":FloatermNew bundle exec ruby -Itest % -n <cword><cr>", noremap)
map("n", "<Leader>rs", ":FloatermNew ruby %<cr>", noremap)
map("n", "[q", ":cprevious<cr>", opts)
map("n", "]q", ":cnext<cr>", opts)
map("n", "<Leader>bp", "orequire 'pry'<cr>binding.pry<Esc>", noremap)
map("n", "<Leader><Space>", ":nohlsearch<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float()")

-- HopLine
local keymap_g = {
  g = {
    name = "HopLine",
    l = { "<cmd>:HopLine<CR>", "HopLine Line" },
    w = { "<cmd>:HopWord<CR>", "HopLine Word" },
    a = { "<cmd>:GitGutterStageHunk<CR>", "Git Add chunk" },
    b = { "<cmd>:Git blame<CR>", "Git blame" },
  }
}
whichkey.register(keymap_g, { noremap = true, silent = true })

-- Telescope
local keymap_t = {
  t = {
    name = "Telescope",
    b = { "<cmd>:Telescope buffers<CR>", "Telescope Buffers" },
    t = { "<cmd>:Telescope lsp_document_symbols<CR>", "Telescope Tags" },
    g = { "<cmd>:Telescope live_grep<CR>", "Telescope Grep" },
    c = { "<cmd>:Telescope git_bcommits<CR>", "Telescope Commits" },
    s = { "<cmd>:Telescope git_status<CR>", "Telescope Status" },
    d = { "<cmd>:TroubleToggle<CR>", "Trouble Toggle" },
    z = { "<cmd>:TZFocus<CR>", "True Zen Focus" },
  }
}
whichkey.register(keymap_t, { prefix = "<leader>", noremap = true })

-- Harpoon
local harpoon_ui = require("harpoon.ui")
local keymap_h = {
  h = {
    name = "Harpoon",
    g = { harpoon_ui.toggle_quick_menu, "Harpoon menu" },
    m = { require("harpoon.mark").add_file, "Harpoon mark" },
    n = { harpoon_ui.nav_next, "Harpoon Next" },
    p = { harpoon_ui.nav_prev, "Harpoon Prev" },
  }
}
whichkey.register(keymap_h, { prefix = "<leader>", noremap = true })

-- RoR
local keymap_r = {
  r = {
    name = "Rails",
    c = { "<cmd>:Econtroller<CR>", "Rails Controller" },
    m = { "<cmd>:Emodel<CR>", "Rails Model" },
    v = { "<cmd>:Eview<CR>", "Rails View" },
    b = { function()
      local buf = vim.api.nvim_get_current_buf()
      local cursor = vim.api.nvim_win_get_cursor(0)

      vim.api.nvim_buf_set_lines(buf, cursor[1], cursor[1], true, { "```ruby", "", "```" })
      vim.api.nvim_win_set_cursor(0, { cursor[1] + 2, 0 })
    end, "Ruby block md" }
  }
}
whichkey.register(keymap_r, { prefix = "<leader>", noremap = true })

-- Github
local keymap_o = {
  g = {
    name = "Github",
    p = { function()
      local members = { "Heavyblade", "gasb150", "jherreraa", "sinourain", "Sainterman", "javierpedrozaing ", "edgarv09" }
      local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))

      utils.picker("Team Members", members, function(selected)
        vim.cmd("Octo search author:" .. selected[1] .. " is:pr is:open created:>=" .. last_two_months)
      end)
    end, "My open PRs" },
    r = { function()
      local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))
      vim.cmd("Octo search user-review-requested:@me is:pr is:open created:>=" .. last_two_months)
    end, "PRs to Review" },
    t = { function()

      local members = { "Heavyblade", "gasb150", "jherreraa", "sinourain", "Sainterman", "javierpedrozaing ", "edgarv09" }
      local projects = { "activemerchant/active_merchant", "spreedly/docs", "spreedly/core", "spreedly/iframe" }

      local members_string = utils.concatenate_table(members, "author:")
      local projects_string = utils.concatenate_table(projects, "repo:")

      local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))

      print("Octo search " .. members_string .. projects_string .. "is:pr is:open created:>=" .. last_two_months)

      vim.cmd("Octo search " .. members_string .. projects_string .. "is:pr is:open created:>=" .. last_two_months)
    end, "Team Prs" }
  }
}
whichkey.register(keymap_o, { prefix = "<leader>", noremap = true })

-- Use ctrl-[hjkl] to select the active split!
map("n", "<c-k>", ":wincmd k<CR>", { silent = true })
map("n", "<c-j>", ":wincmd j<CR>", { silent = true })
map("n", "<c-h>", ":wincmd h<CR>", { silent = true })
map("n", "<c-l>", ":wincmd l<CR>", { silent = true })
map("n", "<c-n>", ":lua require('harpoon.ui').nav_next()<CR>", { silent = true })

