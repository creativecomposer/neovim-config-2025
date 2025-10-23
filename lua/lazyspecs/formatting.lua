return {
  "nvimtools/none-ls.nvim",
  event = { "LspAttach" },
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    table.insert(opts.sources, nls.builtins.formatting.prettier)
  end,
  dependencies = { "nvim-lua/plenary.nvim" }
}
