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
map("n", "<Leader>bp", "orequire 'pry'; binding.pry<Esc>", noremap)
map("n", "<Leader><Space>", ":nohlsearch<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Use ctrl-[hjkl] to select the active split!
map("n", "<c-k>", ":wincmd k<CR>", { silent = true })
map("n", "<c-j>", ":wincmd j<CR>", { silent = true })
map("n", "<c-h>", ":wincmd h<CR>", { silent = true })
map("n", "<c-l>", ":wincmd l<CR>", { silent = true })
map("n", "<c-n>", ":lua require('harpoon.ui').nav_next()<CR>", { silent = true })
map("n", "<c-b>", ":bnext<CR>", { silent = true })

vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float()")

function copyPath(copy_full)
  return function()
    local buff = vim.api.nvim_get_current_buf()
    local full_path = vim.api.nvim_buf_get_name(buff)

    if copy_full then
      vim.fn.setreg("*", full_path)
    else
      local relative = require("harpoon.utils").normalize_path(full_path)
      vim.fn.setreg("*", relative)
    end
  end
end

-- Copy
local keymap_c = {
  { "<leader>c",  group = "Copy",      remap = false },
  { "<leader>cP", copyPath(true),      desc = "Copy Full Path", remap = false },
  { "<leader>cg", "<cmd>:ChatGPT<CR>", desc = "ChatGPT",        remap = false },
  { "<leader>cp", copyPath(false),     desc = "Copy Path",      remap = false },
}

whichkey.add(keymap_c)

-- Telescope
local keymap_t = {
  { "<leader>t",  group = "Telescope",                                 remap = false },
  { "<leader>tb", "<cmd>:Telescope buffers<CR>",                       desc = "Telescope Buffers",    remap = false },
  { "<leader>tc", "<cmd>:Telescope git_bcommits<CR>",                  desc = "Telescope Commits",    remap = false },
  { "<leader>td", "<cmd>:Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble Toggle",       remap = false },
  { "<leader>tg", "<cmd>:Telescope live_grep<CR>",                     desc = "Telescope Grep",       remap = false },
  { "<leader>ts", "<cmd>:Telescope git_status<CR>",                    desc = "Telescope Status",     remap = false },
  { "<leader>tt", "<cmd>:Telescope lsp_document_symbols<CR>",          desc = "Telescope Tags",       remap = false },
  { "<leader>tw", "<cmd>:Telescope workspaces<CR>",                    desc = "Telescope Workspaces", remap = false },
}
whichkey.add(keymap_t)

-- Harpoon
local harpoon_ui = require("harpoon.ui")
local keymap_h = {
  { "<leader>h",  group = "Harpoon",                remap = false },
  { "<leader>hg", harpoon_ui.toggle_quick_menu,     desc = "Harpoon menu", remap = false },
  { "<leader>hm", require("harpoon.mark").add_file, desc = "Harpoon mark", remap = false },
  { "<leader>hn", harpoon_ui.nav_next,              desc = "Harpoon Next", remap = false },
  { "<leader>hp", harpoon_ui.nav_prev,              desc = "Harpoon Prev", remap = false },
}
whichkey.add(keymap_h)

local keymap_r = {
  { "<leader>r",  group = "Ruby / Rest",     remap = false },
  {
    "<leader>rb",
    function()
      local buf = vim.api.nvim_get_current_buf()
      local cursor = vim.api.nvim_win_get_cursor(0)

      vim.api.nvim_buf_set_lines(buf, cursor[1], cursor[1], true, { "```ruby", "", "```" })
      vim.api.nvim_win_set_cursor(0, { cursor[1] + 2, 0 })
    end,
    desc = "Ruby block md",
    remap = false
  },
  { "<leader>rl", require("rest-nvim").last, desc = "Rest Last", remap = false },
  {
    "<leader>rp",
    function()
      require("rest-nvim").run(true)
    end,
    desc = "Rest Preview",
    remap = false
  },
  { "<leader>rx", require("rest-nvim").run, desc = "Rest Run", remap = false },
}
whichkey.add(keymap_r)

-- Github
local keymap_g = {
  { "<leader>g",  group = "Github",               remap = false },
  { "<leader>ga", "<cmd>:GitGutterStageHunk<CR>", desc = "Git Add chunk",        remap = false },
  { "<leader>gb", "<cmd>:Git blame<CR>",          desc = "Git blame",            remap = false },
  { "<leader>gl", "<cmd>:Git log -- %<CR>",       desc = "Git log current file", remap = false },
  {
    "<leader>gp",
    function()
      local members = { "Heavyblade", "gasb150", "jherreraa", "sinourain", "Sainterman", "javierpedrozaing ", "edgarv09" }
      local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))

      utils.picker("Team Members", members, function(selected)
        vim.cmd("Octo search author:" .. selected[1] .. " is:pr is:open created:>=" .. last_two_months)
      end)
    end,
    desc = "My open PRs",
    remap = false
  },
  {
    "<leader>gr",
    function()
      local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))
      vim.cmd("Octo search user-review-requested:@me is:pr is:open created:>=" .. last_two_months)
    end,
    desc = "PRs to Review",
    remap = false
  },
  {
    "<leader>gt",
    function()
      require('octo')
      local members = { "Heavyblade", "gasb150", "javierpedrozaing ", "edgarv09" }
      local projects = { "activemerchant/active_merchant", "spreedly/docs", "spreedly/core", "spreedly/iframe" }

      local members_string = utils.concatenate_table(members, "author:")
      local projects_string = utils.concatenate_table(projects, "repo:")

      local last_two_months = os.date("%Y-%m-%d", os.time() - (2 * 30 * 24 * 60 * 60))

      vim.cmd("Octo search " .. members_string .. projects_string .. "is:pr is:open created:>=" .. last_two_months)
    end,
    desc = "Team Prs",
    remap = false
  },
}

whichkey.add(keymap_g)
