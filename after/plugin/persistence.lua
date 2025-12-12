-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore project [s]ession" })

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select [S]ession to resore" })
