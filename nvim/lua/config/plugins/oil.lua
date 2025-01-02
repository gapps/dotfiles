-- https://github.com/stevearc/oil.nvim
return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		local oil = require("oil")
		oil.setup()
		vim.keymap.set("n", "-", oil.toggle_float, { desc = "Oil" })
	end,
}
