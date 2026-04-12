vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup()
require("mini.statusline").setup({})
-- require("mini.statusline").setup({ use_icons = true })
require("mini.icons").setup()
require("mini.basics").setup()
require("mini.bracketed").setup()
-- require("mini.surround").setup()
