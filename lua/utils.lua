local ts_utils = nil

if vim.g.vscode == nil then
  ts_utils = require 'nvim-treesitter.ts_utils'
end

_G.dump = function(...)
  print(vim.inspect(...))
end

_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

_G.P = function(value)
  print(vim.inspect(value))
end

local M = {}

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

function M.picker(title, options, callback)
  vim.ui.select(options, { prompt = title }, callback)
end

function M.concatenate_table(table, prefix)
  local members_string = ""

  for k, value in ipairs(table) do
    members_string = members_string .. prefix .. value .. " "
  end

  return members_string
end

function M.create_quickfix_list(files)
  local quickfix_list = {}

  for _, file in ipairs(files) do
    table.insert(quickfix_list, { filename = file.filename, lnum = file.line })
  end

  vim.api.nvim_call_function('setqflist', { quickfix_list })
  vim.api.nvim_command('copen')
end

if not vim.g.vscode then
  function M.get_current_method_name()
    local node = ts_utils.get_node_at_cursor()
    if not node then return end

    while node do
      if node:type() == 'method' or node:type() == 'function' then
        local method_name = ts_utils.get_node_text(node:child(1), 0)[1]
        print("Current method: " .. method_name)
        return method_name
      end
      node = node:parent()
    end

    print("No method found at cursor position")
  end
end

M.members = {
  "none",
  "Heavyblade",
  "gasb150",
  "jherreraa",
  "sinourain",
  "javierpedrozaing ",
  "edgarv09",
  "rubenmarindev",
  "KenderBolivarT",
  "Buitragox"
}

M.projects = {
  "none",
  "activemerchant/active_merchant",
  "spreedly/docs",
  "spreedly/core",
  "spreedly/iframe"
}

function M.build_octo_repo_query()
  vim.ui.select(M.members, { prompt = 'Select Member', }, function(selected)
    local selected_member = selected

    vim.ui.select(M.projects, { prompt = 'Select Project', }, function(selected)
      local selected_project = selected

      local search_term = vim.fn.input("Search for: ")

      local query = "Octo search is:pr"
      if selected_member ~= "none" then
        query = query .. " author:" .. selected_member
      end
      if selected_project ~= "none" then
        query = query .. " repo:" .. selected_project
      end
      if search_term ~= "" then
        query = query .. " " .. search_term
      end

      vim.cmd(query)
    end)
  end)
end

return M
