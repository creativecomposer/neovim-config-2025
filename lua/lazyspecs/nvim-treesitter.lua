-- nvim-treesitter new development happens in the main branch:
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main
-- It does not support the older `require 'nvim-treesitter.configs'.setup(...)` anymore.
-- Therefore, its configuration is not the same as before.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  version = false,
  build = ":TSUpdate",
  event = { "VeryLazy" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts = {
    indent = { enable = true },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    folds = { enable = true },
  },
  config = function(_, opts)
    local out = vim.fn.executable("tree-sitter")
    if out == 1 then
      print("tree-sitter-cli is already present. Nothing to do")
      return
    end

    print("tree-sitter-cli is not present. Installing...")
    out = vim.fn.system({ "npm", "install", "-g", "tree-sitter-cli" })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to install tree-sitter-cli:\n", "ErrorMsg" },
        { out,                                    "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
    print('tree-sitter-cli installed.')

    local TS = require("nvim-treesitter")
    TS.setup(opts)
  end,
}
