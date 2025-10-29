return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local api = require("nvim-tree.api")

    nvimtree.setup({
      on_attach = function(bufnr)
        -- mantém todos os keymaps padrões
        require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

        -- atalhos extras
        local function opts(desc)
          return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set("n", "l", api.node.open.edit, opts("Open File/Folder"))
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open File/Folder"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Folder / Go Up"))
      end,
      view = {
        width = 50,
        relativenumber = true,
      },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = { arrow_closed = "", arrow_open = "" },
          },
        },
      },
      actions = { open_file = { window_picker = { enable = false } } },
      filters = { custom = { ".DS_Store" } },
      git = { ignore = false },
    })

    -- atalhos do leader
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}

