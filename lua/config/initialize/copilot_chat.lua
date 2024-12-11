local M = {}

M.opts = {
  debug = false, -- Enable debugging
  window = {
    layout = 'float',
    title = 'Copilot Chat',
    width = 0.7, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.7,
  },
  prompts = {
    BlockToInline = {
      prompt = 'Refactor this block of code to use the brackets version of ruby block and inline it.',
      system_prompt = 'You are an expert ruby programmer.',
      description = 'From do-end to {}',
    },
    ImproveReadability = {
      prompt = 'Improve the readability of this code by implemeting ruby best practices like DRY, SRP, etc.',
      system_prompt = 'You are an expert ruby programmer.',
      description = 'Improve readability'
    },
  },
  auto_follow_cursor = false,
  question_header = " User ",
  answer_header = " Copilot ",
}


return M
