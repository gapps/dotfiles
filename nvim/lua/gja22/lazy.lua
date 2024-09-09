-- Set up initial configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add lazy to the `runtimepath`, this allows is to `require` it.
vim.opt.rtp:prepend(lazypath)

-- Set up lazy and load my `lua/gja22/plugins/` directory
require("lazy").setup({ import = "gja22.plugins" }, {
	change_detection = {
		notify = false,
	},
})
