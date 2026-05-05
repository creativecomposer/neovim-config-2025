return {
  "ggml-org/llama.vim",
  event = { "VeryLazy" },
  init = function()
    vim.g.llama_config = {
      auto_fim = false,
      endpoint_fim = "http://127.0.0.1:8080/infill",
      endpoint_inst = "http://127.0.0.1:8080/v1/chat/completions",
      show_info = false,
    }
  end,
}
