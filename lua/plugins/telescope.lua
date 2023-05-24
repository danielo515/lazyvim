local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {

    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>sp",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Search in plugin files",
    },
    { "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/",       Util.telescope("live_grep"),                        desc = "Grep (root dir)" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader><space>", Util.telescope("command_history"),                  desc = "Command history" },
    -- find
    { "<leader>fb",      "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
    { "<leader>ff",      Util.telescope("files"),                            desc = "Find Files (root dir)" },
    { "<leader>fs",      Util.telescope("git_status"),                       desc = "Git status files" },
    {
      "<leader>fF",
      Util.telescope("files", { cwd = false, hidden = true, no_ignore = true }),
      desc = "Find all Files (cwd)",
    },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                            desc = "Recent" },
    { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }),     desc = "Recent (cwd)" },
    -- search
    { "<leader>sa", "<cmd>Telescope autocommands<cr>",                        desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",           desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope commands<cr>",                            desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>",                 desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>",                         desc = "Workspace diagnostics" },
    { "<leader>sg", "<cmd>Telescope live_grep_args<cr>",                      desc = "Live grep args" },
    { "<leader>sG", Util.telescope("live_grep", { cwd = false }),             desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",                           desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>",                          desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",                             desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>",                           desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>",                               desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>",                         desc = "Options" },
    { "<leader>sR", "<cmd>Telescope resume<cr>",                              desc = "Resume" },
    { "<leader>sw", Util.telescope("grep_string"),                            desc = "Word (root dir)" },
    { "<leader>sW", Util.telescope("grep_string", { cwd = false }),           desc = "Word (cwd)" },
    { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    {
      "<leader>ss",
      Util.telescope("lsp_document_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      Util.telescope("lsp_dynamic_workspace_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      desc = "Goto Symbol (Workspace)",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
          ["<C-h>"] = function(...)
            return require("telescope.actions").which_key(...)
          end,
          ["<C-w>"] = function(...)
            return require("telescope.actions").smart_add_to_loclist(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["x"] = function(...)
            return require("telescope.actions").delete_buffer(...)
          end,
          ["<c-h>"] = function(...)
            return require("telescope.actions").which_key(...)
          end,
          ["<C-w>"] = function(...)
            return require("telescope.actions").smart_add_to_loclist(...)
          end,
        },
      },
    },
  },
}
