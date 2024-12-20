return {
	"lunarvim/darkplus.nvim",
	"gruvbox-community/gruvbox",
	"navarasu/onedark.nvim",
	"rose-pine/neovim",
	"sainnhe/sonokai",
	{
		"rebelot/kanagawa.nvim",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("kanagawa")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
