vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
local oil = require("oil")
require("oil").setup({
  view_options = {
    show_hidden = true, -- Show hidden files by default
  },
})
vim.keymap.set("n", "-", oil.toggle_float, { desc = "Oil" })
