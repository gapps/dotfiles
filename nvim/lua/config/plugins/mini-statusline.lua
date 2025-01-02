-- https://github.com/echasnovski/mini.statusline
return {
	"echasnovski/mini.statusline",
	version = "*",
	enabled = true,
	lazy = false,
	config = function()
		require("mini.statusline").setup({ use_icons = true })
	end,
}
