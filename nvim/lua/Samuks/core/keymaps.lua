vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

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

