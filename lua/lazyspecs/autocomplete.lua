local function config()
  vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  local cmp = require("cmp")

  return {
    -- Each source is a plugin that needs to be installed separately
    sources = {
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'copilot',  group_index = 2 },
    },
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    preselect = true,
    mapping = cmp.mapping.preset.insert({
      -- `Enter` key to confirm completion
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      -- Ctrl+Space to trigger completion menu
      ['<C-Space>'] = cmp.mapping.complete(),
      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
  }
end

return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "zbirenbaum/copilot-cmp",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
      end,
      specs = {
        {
          "hrsh7th/nvim-cmp",
          optional = true,
          ---@param opts cmp.ConfigSchema
          opts = function(_, opts)
            table.insert(opts.sources, 1, {
              name = "copilot",
              group_index = 2,
              priority = 100,
            })
          end,
        },
      },
    },
  },
  opts = config
}
