vim.g.mapleader = " "
vim.g.maplocalleader = " "

---- START - My own command shortcuts using the leader key

-- source current buffer (useful for reloading lua config files)
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Shortcut to paste from the register 0 in order to paste from last yanked text
vim.keymap.set('n', '<Leader>0', '"0p', { desc = "Paste from register [0]" })

-- shortcut to copy highlighted text to clipboard
vim.keymap.set({ "n", "v" }, "<leader>c", [["+y]], { desc = "[C]opy highlighted text to clipboard" })

vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to previous location list item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to next location list item" })

-- See and clear messages
vim.keymap.set("n", "<leader>m", ":10mes<cr>", { desc = "Show the last 10 [M]essages" })
vim.keymap.set("n", "<leader>dm", ":mes clear<cr>", { desc = "[D]elete all [M]essages" })

-- shortcut to open netrw
vim.keymap.set("n", "<leader>n", vim.cmd.Ex, { desc = "Open [n]etrw" })

-- shortcut to paste from clipboard
vim.keymap.set('n', '<Leader>p', '"+p', { desc = "[P]aste from clipboard" })

-- Show diagnostic for the current line in a floating window
vim.keymap.set("n", "<leader>xx", "<cmd>lua vim.diagnostic.open_float(nil, { focus = false })<cr>", { desc = "Show Diagnostic for current line" })

-- Open undotree in a split
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- shortcut to open terminal window
--vim.keymap.set('n', '<leader>t', ':15new <Bar> terminal<CR>i', { desc = "Open [T]erminal" })

---- END - My own command shortcuts using the leader key

---- BEGIN - Convenient keymaps to navigate easier

-- highlight lines and move them around with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { desc = "Move up even if line is wrapped", expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { desc = "Move down even if line is wrapped", expr = true, silent = true })

-- do not lose the previously yanked text when pasting on a selected text
vim.keymap.set("x", "p", [["_dP]])

-- shortcut to open previous buffer
vim.keymap.set('n', '<S-Tab>', ':bp<CR>', { desc = "Go to previous buffer" })
-- shortcut to open next buffer
vim.keymap.set('n', '<Tab>', ':bn<CR>', { desc = "Go to next buffer" })
-- map c-a because it is easier than doing c-^ or c-6 to go to the alternative file
vim.keymap.set('n', '<C-a>', '<C-^>')

-- move quickfix and location lists easier
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to previous quickfix item" })

-- move to next split easily from terminal mode
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>j', { desc = "Move down from termial" })
-- use Esc to come out of terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

---- END - Convenient keymaps to navigate easier

