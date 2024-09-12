local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local ts_utils = require 'nvim-treesitter.ts_utils'

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
  local opts = require("telescope.themes").get_dropdown {}

  pickers.new(opts, {
    prompt_title = title,
    finder = finders.new_table {
      results = options
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        callback(selection)
      end)
      return true
    end,
  }):find()
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

return M
