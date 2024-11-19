return {
  dependencies = { "lukas-reineke/cmp-rg", "hrsh7th/cmp-cmdline", "andersevenrud/cmp-tmux" },
  event = { "InsertEnter", "CmdWinEnter" },
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local sources = {
      {
        name = "rg",
        keyword_length = 4,
        max_item_count = 5,
        priority_weight = 60,
        group_index = 1,
        option = {
          additional_arguments = "--smart-case --hidden",
        },
      },
      {
        name = "tmux",
        group_index = 1,
        max_item_count = 5,
        option = { all_panes = true, label = "[tmux]" },
        priority_weight = 50,
      },
    }
    vim.list_extend(opts.sources, sources)
    local format = opts.formatting.format
    opts.formatting.format = function(c, item)
      item.menu = c.source.name
      return format(_, item)
    end

    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    local cmdline_mappings = {
      select_next_item = {
        c = function(fallback)
          if cmp.visible() then
            return cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })(fallback)
          else
            return cmp.mapping.complete({ reason = cmp.ContextReason.Auto })(fallback)
          end
        end,
      },
      select_prev_item = {
        c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      },
    }
    -- cmp.setup.cmdline("/", {
    --   mapping = {
    --     ["<Down>"] = cmdline_mappings.select_next_item,
    --     ["<C-n>"] = cmdline_mappings.select_next_item,
    --     ["<Tab>"] = cmdline_mappings.select_next_item,
    --     ["<C-p>"] = cmdline_mappings.select_prev_item,
    --     ["<Up>"] = cmdline_mappings.select_prev_item,
    --     ["<S-Tab>"] = cmdline_mappings.select_prev_item,
    --   },
    --   sources = cmp.config.sources({ { name = "buffer" }, }, { { name = "cmdline_history" }, }),
    -- })
  end,
}
