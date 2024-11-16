return {
	"lunarvim/darkplus.nvim",
	"gruvbox-community/gruvbox",
	"Tsuzat/NeoSolarized.nvim",
	"navarasu/onedark.nvim",
	"rose-pine/neovim",
	"sainnhe/sonokai",
	{
		"habamax/vim-habamax",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("habamax")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("kanagawa")
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("tokyonight-night")
		-- end,
	},
}
