return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-e>",
      },
    },
    panel = { enabled = true },
  },
}
