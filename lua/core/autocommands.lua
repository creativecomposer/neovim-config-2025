vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  desc = 'Show diagnostic messages in a floating window',
  group = vim.api.nvim_create_augroup("vim_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
  end
})
