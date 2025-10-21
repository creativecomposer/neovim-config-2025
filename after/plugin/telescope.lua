local builtin = require('telescope.builtin')

-- Keymaps to work on files and text
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope [F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Telescope [F]ind [C]urrent word' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope [F]ind [F]iles' })
vim.keymap.set('n', '<leader>fw', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope [F]ind input [W]ord' })

-- Keymaps to work on LSP
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Telescope LSP [G]o to definition' })
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Telescope LSP [G]o to references' })

-- Keymaps to work on Telescope
vim.keymap.set('n', '<leader>t', builtin.builtin, { desc = '[T]elescope builtin pickers' })
