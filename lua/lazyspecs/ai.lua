return {
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
      should_attach = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
          --if string.match(bufname, "env") then
          print("env file detected, do not attach copilot")
          return false
        end

        print("copilot attached")
        return true
      end
    },
    --keys = {
    --  {
    --    "<leader>gh",
    --    function()
    --      require("copilot.suggestion").toggle_auto_trigger()
    --    end,
    --    desc = "Toggle github copilot suggestions",
    --  },
    --},
  },
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
    opts = {
      display = {
        chat = {
          show_settings = true,
        }
      },
      interactions = {
        chat = {
          adapter = {
            name = "copilot",
            model = "gpt-5-mini",
          },
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        },
        background = {
          adapter = {
            name = "ollama",
            model = "qwen-7b-instruct",
          },
        },
      },
    },
    keys = {
      { "<leader>ga", ":CodeCompanionActions<cr>",     mode = { "n", "v" }, desc = "Open code companion [A]ctions" },
      { "<leader>gc", ":CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Open code companion [C]hat" },
      { "<leader>gv", ":CodeCompanionChat Add<cr>",    mode = { "v" },      desc = "Open code companion chat with selected text" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  }
}
