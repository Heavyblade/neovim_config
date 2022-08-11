local M = {}

function M.setup()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.gtd.base"] = {
         config = { -- Note that this table is optional and doesn't need to be provided
             -- Configuration here
          workspace = 'work'
         }
      },
      ["core.norg.qol.toc"] = {},
      ["core.norg.completion"] = {
         config = {
             engine = "nvim-cmp"
         }
      },
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
            tasks = "~/notes/tasks",
          },
        },
      },
    },
  }
end

return M
