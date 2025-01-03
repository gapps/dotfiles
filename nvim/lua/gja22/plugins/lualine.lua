return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	opts = {
		options = {
			icons_enabled = true,
			globalstatus = false,
			component_separators = "",
			section_separators = "",
			-- section_separators = { left = "", right = "" },
			-- component_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			-- path options  0=filename  1=rel path  2=abs path
			lualine_c = { { "filename", file_status = true, path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "%L" },
			lualine_z = { { "location", padding = 0 } },
		},
	},
}
