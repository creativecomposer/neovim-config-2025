return {
    "nvim-telescope/telescope.nvim",
    event = { "VeryLazy" },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
    },
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
