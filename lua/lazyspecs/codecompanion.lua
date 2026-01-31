local function llama_cpp_config()
  return require("codecompanion.adapters").extend("openai_compatible", {
    env = {
      url = "http://127.0.0.1:8080", -- llama.cpp instance url
      api_key = "TERM",
      chat_url = "/v1/chat/completions",
    },
    handlers = {
      parse_message_meta = function(self, data)
        local extra = data.extra
        if extra and extra.reasoning_content then
          data.output.reasoning = { content = extra.reasoning_content }
          if data.output.content == "" then
            data.output.content = nil
          end
        end
        return data
      end,
    },
  })
end

-- See https://codecompanion.olimorris.dev/usage/inline-assistant for more info on inline assistant
local inline_keymaps = {
  accept_change = {
    modes = { n = "ga" },
    description = "Accept the suggested change",
  },
  reject_change = {
    modes = { n = "gx" },
    opts = { nowait = true },
    description = "Reject the suggested change",
  },
  stop = {
    modes = { n = "q" },
    index = 4,
    callback = "keymaps.stop",
    description = "Stop request",
  },
}

return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionCmd", "CodeCompanionActions" },
  opts = {
    adapters = { -- Ref: https://codecompanion.olimorris.dev/configuration/adapters-http#llama-cpp-with-reasoning-format-deepseek
      http = {
        ["llama.cpp"] = llama_cpp_config
      },
    },
    display = {
      chat = {
        show_settings = true,
      },
      inline = {
        layout = "buffer", -- vertical|horizontal|buffer
      },
    },
    interactions = {
      chat = {
        adapter = "llama.cpp",
      },
      inline = {
        adapter = "llama.cpp",
        keymaps = inline_keymaps,
      },
    },
  },
  keys = {
    { "<leader>la", ":CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Open code companion [A]ctions" },
    { "<leader>li", ":'<,'>CodeCompanion ",      mode = { "x" },      desc = "Open code companion [I]nline" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
    "ravitemer/mcphub.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
    },
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
  },
  init = function()
    require("plugins.fidget-spinner"):init()
  end,
}
