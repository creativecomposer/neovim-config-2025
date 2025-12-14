return {
  "folke/persistence.nvim",
  lazy = false,
  opts = {
    -- add any custom options here
  },
  keys = function()
    local keys = {
      {
        "<leader>rs",
        -- load the session for the current directory
        function() require("persistence").load() end,
        desc = "[R]estore project session",
      },
      {
        "<leader>rS",
        -- select a session to load
        function() require("persistence").select() end,
        desc = "Select [S]ession to resore",
      },
    }
    return keys
  end,
}
