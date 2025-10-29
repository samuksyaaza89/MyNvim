require("Samuks.core")
require("Samuks.lazy")
require("Samuks.lsp")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.showtabline = 0

-- === Função para rodar arquivos Python ===
function _G.RunPythonFile()
  local current_file = vim.fn.expand("%:p")
  if current_file:match("%.py$") then
    vim.cmd("!python3 %")
  else
    print("Not a Python file.")
  end
end
vim.api.nvim_set_keymap("n", "<leader>rp", ":lua _G.RunPythonFile()<CR>", { noremap = true, silent = true })

-- === Função para compilar e rodar arquivos C ===
function _G.RunCFile()
  local current_file = vim.fn.expand("%:p")
  if current_file:match("%.c$") then
    local output_file = vim.fn.expand("%:r") -- mesmo nome, sem extensão
    vim.cmd(string.format("!gcc -o %s %s && ./%s", output_file, current_file, output_file))
  else
    print("Not a C file.")
  end
end
vim.api.nvim_set_keymap("n", "<leader>rc", ":lua _G.RunCFile()<CR>", { noremap = true, silent = true })

-- === Função para compilar e rodar arquivos C++ ===
function _G.RunCppFile()
  local current_file = vim.fn.expand("%:p")
  if current_file:match("%.cpp$") then
    local output_file = vim.fn.expand("%:r")
    vim.cmd(string.format("!g++ -o %s %s && ./%s", output_file, current_file, output_file))
  else
    print("Not a C++ file.")
  end
end
vim.api.nvim_set_keymap("n", "<leader>rpp", ":lua _G.RunCppFile()<CR>", { noremap = true, silent = true })

vim.g.python3_host_prog = "/home/samuksyaaza/venvs/py311/bin/python3.11"
