-- After installing the parsers using the below line, the jsx syntax highlighted properly and indentation worked as expected
require('nvim-treesitter').install({ "bash", "css", "dockerfile", "html", "json", "javascript", "lua", "markdown",
  "python", "scss", "tsx", "typescript", "vim", "yaml", })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
  callback = function(ev)
    local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
    if not vim.treesitter.language.add(lang) then
      print("Treesitter does not support the language", ft, lang)
      return
    end
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.treesitter.start() -- This throws error when a parser for the language in the currently opened buffer is not installed
  end,
})
