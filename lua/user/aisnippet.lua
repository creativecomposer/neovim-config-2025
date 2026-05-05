-- Helper functions to show UI updates from asynchronous code
local function safe_notify(msg, log_level)
  vim.schedule(function()
    vim.notify(msg, log_level)
  end)
end

local function safe_float(output)
  vim.schedule(function()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    local opts = {
      relative = "win",
      row = 10,
      col = 20,
      width = 100,
      height = 25,
      border = "double"
    }
    vim.api.nvim_open_win(buf, true, opts)
  end)
end

-- Helper function to convert text with newlines into an array
local function split_string(input)
  local lines = {}
  for line in input:gmatch("[^\n]+") do
    table.insert(lines, line)
  end
  return lines
end

-- User command to insert code as per the selected instruction in the current buffer
vim.api.nvim_create_user_command("AICode", function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)
  local code_block = table.concat(lines, "\n")
  local temp_file = os.tmpname()

  local cmd = string.format("echo %q | aichat --role %%code%% > %s", code_block, temp_file)
  print("Executing " .. cmd)
  os.execute(cmd)

  local output = {}
  for line in io.lines(temp_file) do
    table.insert(output, line)
  end
  vim.api.nvim_buf_set_lines(0, end_line, end_line, false, output)
  os.remove(temp_file)
end, { range = true })

local function run_command()
  prompt = vim.fn.input("Prompt > ")
  local command = { "aichat", prompt }
  safe_notify(table.concat(command), vim.log.levels.DEBUG)

  local output = ""
  local on_exit = function(obj)
    print(string.format("%s finished with code ", command[1]) .. obj.code)
    safe_float(split_string(output))
  end

  vim.system(command, {
    text = true,
    timeout = 20000, -- timeout 20 seconds
    stdout = function(_, data)
      if data then
        --safe_float(split_string(data))
        output = output .. data
      end
    end
  }, on_exit)
end

vim.api.nvim_create_user_command("AskAI", run_command, {})
vim.keymap.set("n", "<leader>fa", ":AskAI<cr>", { desc = "[F]ind answer by asking [A]I" })
