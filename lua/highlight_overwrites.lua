-- Telescope and Harpoon Background color
vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = "#54546d", bg = "NONE", blend = 50 })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = "#54546d", bg = "NONE", blend = 50 })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = "#54546d", bg = "NONE", blend = 50 })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = "#54546d", bg = "NONE", blend = 50 })

-- Float items
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = "#54546d", bg = "NONE", blend = 0 })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = "#54546d", bg = "NONE", blend = 0 })

-- Base
vim.api.nvim_set_hl(0, 'FloatermBorder', { fg = "#54546d", bg = "NONE", blend = 50 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#54546d", blend = 50 })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = "#54546d", blend = 50 })

-- GitGutter
vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = "#bdb9a4", blend = 50 })
vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = "#728d51", blend = 50 })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = "#804e5e", blend = 50 })
