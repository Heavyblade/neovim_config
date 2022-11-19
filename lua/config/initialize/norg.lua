local M = {}

function M.setup()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.gtd.base"] = {
        config = {
          workspace = 'work'
        }
      },
      ["core.norg.qol.toc"] = {},
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.export"] = { config = {} },
      ["core.export.markdown"] = { config = {} },
      ["core.presenter"] = {
        config = {
          zen_mode = "truezen"
        }
      },
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/tasks",
          },
        },
      },
    },
  }
end

return M
