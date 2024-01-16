return {
  "reasonml-editor/vim-reason-plus",
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {

        rescriptls = {
          cmd = {
            "node",
            "/Users/danielo/.config/coc/extensions/rescript-vscode-1.2.1/extension/server/out/server.js",
            "--stdio",
          },
          filetypes = { "reason", "rescript" },
        },
      },
    },
  },
}
