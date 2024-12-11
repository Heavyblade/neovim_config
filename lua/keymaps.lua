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
map("n", "<Leader>rs", ":FloatermNew ruby %<cr>", noremap)
map("n", "<Leader>rg", ":FloatermNew go run main.go<cr>", noremap)
map("n", "[q", ":cprevious<cr>", opts)
map("n", "]q", ":cnext<cr>", opts)
map("n", "<Leader>bp", "orequire 'pry'; binding.pry<Esc>", noremap)
map("n", "<Leader><Space>", ":nohlsearch<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("n", "<Leader>p", '"0p', noremap)
map("v", "<Leader>p", '"0p', noremap)
map("v", "<Leader>ae", ':AvanteEdit<CR>', noremap)

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

-- TaskWarrior neovim integration
function add_task()
  local task_description = vim.fn.input("Enter task description: ")
  local cmd = "task add " .. task_description
  vim.fn.system(cmd)
end

function remove_task()
  local task_id = vim.fn.input("Enter task id: ")
  local cmd = "task " .. task_id .. " done"
  vim.fn.system(cmd)
  vim.api.nvim_command("echo ''")
end

function show_task_list_on_modal_window()
  local task_list = vim.fn.system("task list")
  vim.api.nvim_command("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, true, vim.fn.split(task_list, "\n"))
end

-- Copy
local keymap_c = {
  { "<leader>c",  group = "Copy",                  remap = false },
  { "<leader>cp", copyPath(false),                 desc = "Copy Path",             remap = false },
  { "<leader>cP", copyPath(true),                  desc = "Copy Full Path",        remap = false },
  { "<leader>cg", "<cmd>:ChatGPT<CR>",             desc = "ChatGPT",               remap = false },
  { "<leader>cc", "<cmd>:CopilotChatToggle<CR>",   desc = "Copilot chat toggle",   remap = false, mode = { "v", "n" } },
  { "<leader>co", "<cmd>:CopilotChatOptimize<CR>", desc = "Copilot chat Optimize", remap = false, mode = "v" },
}
whichkey.add(keymap_c)

-- Telescope
local keymap_t = {
  { "<leader>t",  group = "Telescope",                                 remap = false },
  { "<leader>tl", "<cmd>:FloatermNew task list<CR>",                   desc = "TaskWarrior task list",   remap = false },
  { "<leader>ta", add_task,                                            desc = "TaskWarrior add task",    remap = false },
  { "<leader>tx", remove_task,                                         desc = "TaskWarrior remove task", remap = false },
  { "<leader>tb", "<cmd>:Telescope buffers<CR>",                       desc = "Telescope Buffers",       remap = false },
  { "<leader>tc", "<cmd>:Telescope git_bcommits<CR>",                  desc = "Telescope Commits",       remap = false },
  { "<leader>td", "<cmd>:Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble Toggle",          remap = false },
  { "<leader>tg", "<cmd>:Telescope live_grep<CR>",                     desc = "Telescope Grep",          remap = false },
  { "<leader>ts", "<cmd>:Telescope git_status<CR>",                    desc = "Telescope Status",        remap = false },
  { "<leader>tt", "<cmd>:Telescope lsp_document_symbols<CR>",          desc = "Telescope Tags",          remap = false },
  { "<leader>ti", "<cmd>:ToggleTerm<CR>",                              desc = "Toggle term",             remap = false },
  { "<leader>tn", "<cmd>:TestNearest<CR>",                             desc = "Test nearest",            remap = false },
  { "<leader>tf", "<cmd>:TestFile<CR>",                                desc = "Test File",               remap = false },
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
  { "<leader>r",  group = "Ruby / Rest", remap = false },
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
  {
    "<leader>rt",
    function()
      local method = require("utils").get_current_method_name()
      local command = ":FloatermNew bundle exec ruby -Itest % -n " .. method
      vim.api.nvim_command(command)
    end,
    desc = "Run current test",
    remap = false
  },
  { "<leader>rx", "<cmd>:Rest run<CR>",  desc = "Rest Run", remap = false },
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
    utils.build_octo_repo_query,
    desc = "Search PR in repo",
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

-- Kuala
local kulala = require("kulala")
local keymap_k = {
  { "<leader>k",  group = "Kulala", remap = false },
  { "<leader>kr", kulala.run,       desc = "Kulala run",          remap = false },
  { "<leader>]",  kulala.jump_next, desc = "Kulala next",         remap = false },
  { "<leader>[",  kulala.jump_prev, desc = "Kulala Prev",         remap = false },
  { "<leader>kc", kulala.copy,      desc = "Kulala copy as curl", remap = false },
}
whichkey.add(keymap_k)

-- Avante
local keymap_a = {
  { "<leader>a",  group = "Avante", remap = false },
  { "<leader>aa", "<cmd>:AvanteToggle<CR>", desc = "Avante", remap = false },
}
whichkey.add(keymap_a)
