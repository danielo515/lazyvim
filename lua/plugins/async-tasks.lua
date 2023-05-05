--@type lazy.PluginSpec
return {
  "skywind3000/asyncrun.vim",
  cmd = { "AsyncTask", "AsyncTaskList" },
  {
    "skywind3000/asynctasks.vim",
    requires = {
      "skywind3000/asyncrun.vim",
    },
    init = function()
      vim.cmd([[
          let g:asyncrun_open = 8
          let g:asynctask_template = '~/.config/lvim/task_template.ini'
          let g:asynctasks_extra_config = ['~/.config/lvim/tasks.ini']
          ]])
    end,
  },
}
