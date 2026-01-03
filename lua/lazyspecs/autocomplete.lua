--local function config()
--  vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
--  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
--  local cmp = require("cmp")
--
--  return {
--    -- Each source is a plugin that needs to be installed separately
--    sources = {
--      { name = 'nvim_lsp' },
--    },
--    completion = {
--      completeopt = "menu,menuone,noinsert",
--    },
--    preselect = true,
--    mapping = cmp.mapping.preset.insert({
--      -- `Enter` key to confirm completion
--      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--      -- Ctrl+Space to trigger completion menu
--      ['<C-Space>'] = cmp.mapping.complete(),
--      -- Scroll up and down in the completion documentation
--      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-d>'] = cmp.mapping.scroll_docs(4),
--    }),
--  }
--end
--
--return {
--  "hrsh7th/nvim-cmp",
--  version = false,
--  event = { "InsertEnter" },
--  dependencies = {
--    "hrsh7th/cmp-nvim-lsp",
--  },
--  opts = config
--}

return {
  "saghen/blink.cmp",
  version = '1.*',

  event = { "InsertEnter" },
  opts = {
    keymap = { preset = 'enter' },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 200, } },
  },
}
