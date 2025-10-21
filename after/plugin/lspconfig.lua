-- Configure language server specific setup
-- `require("lspconfig") ` approach is deprecated. The new approch is to use vim.lsp.config

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- This is where you enable features that only work if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  group = vim.api.nvim_create_augroup("lspconfig", { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    print("LSP client name:", client.name)
    -- Disable default LSP formatting for js/ts files because we will use Prettier instead
    if client.name == "ts_ls" then
      client.server_capabilities.documentFormattingProvider = false
    end

    local opts = { buffer = args.buf, noremap = true, silent = true }
    vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F5>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})
