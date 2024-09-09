return {
	"github/copilot.vim",
	-- enabled = false,
	config = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			desc = "Disable Copilot by default for new buffers",
			command = "Copilot disable",
		})
	end,
}
