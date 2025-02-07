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
    TransLateToEnglish = {
      prompt = 'Translate this text to English.',
      system_prompt = 'You are an assistant translator who helps translate text and check grammar and correctness',
      description = 'Translate to English'
    },
    ImproveArticle = {
      prompt = 'Improve the grammar and wording of this article',
      system_prompt = 'I want you to act as a tech writer. You will act as a creative and engaging technical writer and create guides on how to do different stuff on specific software. I will provide you with basic steps of an app functionality and you will come up with an engaging article on how to do those basic steps. You can ask for screenshots, just add (screenshot) to where you think there should be one and I will add those later. These are the first basic steps of the app functionality: "1.Click on the download button depending on your platform 2.Install the file. 3.Double click to open the app"',
      description = 'Improve article'
    },
  },
  auto_follow_cursor = false,
  question_header = " User ",
  answer_header = " Copilot ",
}


return M
