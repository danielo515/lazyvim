return {
  "FeiyouG/command_center.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>p", "<CMD>Telescope command_center<CR>", mode = { "n", "v" } },
  },
  config = function()
    local telescope = require("telescope")
    local command_center = require("command_center")
    local noremap = { noremap = true }

    command_center.add({
      {
        desc = "Open command_center",
        cmd = "<CMD>Telescope command_center<CR>",
        keys = {
          { "n", "<leader>p", noremap },
          { "v", "<leader>p", noremap },
        },
      },
      {
        desc = "Advanced git search",
        cmd = "<CMD>AdvancedGitSearch<CR>",
      },
      {
        desc = "Project build",
        cmd = "<CMD>AsyncTask project-build<CR>",
      }
    }, { mode = command_center.mode.ADD })

    telescope.setup {
      extensions = {
        command_center = {
          components = {
            command_center.component.DESC,
            command_center.component.KEYS,
          },
          sort_by = {
            command_center.component.DESC,
            command_center.component.KEYS,
          },
          auto_replace_desc_with_cmd = false,
        }
      }
    }

    telescope.load_extension('command_center')
  end
}
