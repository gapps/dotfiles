-- https://github.com/echasnovski/mini.basics
--
return {
	{
		"echasnovski/mini.basics",
		version = "*",
		lazy = false,
		config = function()
			require("mini.basics").setup()
		end,
	},
}
