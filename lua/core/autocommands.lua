-- Make UI look cool - highlight yanked text for a moment
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Show the diagnostic for the word under cursor in a floating window
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  desc = 'Show diagnostic messages in a floating window',
  group = vim.api.nvim_create_augroup("vim_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = 'Format buffer content using LSP',
  group = vim.api.nvim_create_augroup("vim_formatting", { clear = true }),
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.buf.format({ bufnr = bufnr })
  end,
})
