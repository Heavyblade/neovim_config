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
    ImproveCode = {
      prompt = 'Improve and optimize this code by implemeting ruby best practices like DRY, SRP, etc.',
      system_prompt = 'You are an expert ruby programmer.',
      description = 'Improve Code'
    },
    TransLateToEnglish = {
      prompt = 'Translate this text to English.',
      system_prompt =
      'You are an assistant translator who helps translate text to English and check grammar and correctness',
      description = 'Translate to English'
    },
    CorrectGrammar = {
      prompt = 'Correct the grammar, syntax, and redaction of this article without changing its meaning or main ideas.',
      system_prompt =
      'Correct the grammar, syntax, and redaction of this text without changing its meaning or main ideas.',
      mapping = '<leader>ccg',
      description = 'Correct Grammar and Syntax'
    },
  },
  auto_follow_cursor = false,
  question_header = " User ",
  answer_header = " Copilot ",
}


return M
