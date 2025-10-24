return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile", },
    opts = {
      -- The language servers in ensure_installed must be in https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
      ensure_installed = { 'cssls', 'eslint', 'html', 'lua_ls', 'pyright', 'ts_ls', },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
}
