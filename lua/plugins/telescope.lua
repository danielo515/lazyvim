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
    { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
    { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (root dir)" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader><space>", LazyVim.pick("command_history"), desc = "Command history" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (root dir)" },
    { "<leader>fs", LazyVim.pick("git_status"), desc = "Git status files" },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ cwd = false, hidden = true, no_ignore = false })
      end,
      desc = "Find all Files (cwd)",
    },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    {
      "<leader>f.",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.fnamemodify(vim.fn.expand("%"), ":h") })
      end,
      desc = "Sibling files",
    },
    -- search
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sv", "<cmd>Telescope vim_options<cr>", desc = "Vim options" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>sg", "<cmd>Telescope live_grep_args<cr>", desc = "Live grep args" },
    { "<leader>sG", LazyVim.pick("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>sw", LazyVim.pick("grep_string"), desc = "Word (root dir)" },
    { "<leader>sW", LazyVim.pick("grep_string", { cwd = false }), desc = "Word (cwd)" },
    { "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    {
      "<leader>ss",
      LazyVim.pick("lsp_document_symbols", {
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
      LazyVim.pick("lsp_dynamic_workspace_symbols", {
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
    pickers = {
      buffers = {
        ignore_current_buffer = true,
        sort_lastused = true,
        sort_mru = true,
      },
    },
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
            LazyVim.pick("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            LazyVim.pick("find_files", { hidden = true })()
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
