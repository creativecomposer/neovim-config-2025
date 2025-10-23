return {
  "lewis6991/gitsigns.nvim",
  event = "BufWinEnter",
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
      end

      map("n", "<leader>B", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>b", function() gs.blame() end, "Blame Buffer")
    end,
  },
}
