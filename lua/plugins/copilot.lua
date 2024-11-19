return {
  "zbirenbaum/copilot.lua",
  enabled = false,
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
