-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/suketa/nvim-dap-ruby
return {
	"mfussenegger/nvim-dap",
	lazy = false,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"suketa/nvim-dap-ruby",
		"nvim-neotest/nvim-nio",
		-- 		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_ruby = require("dap-ruby")

		-- dap setup
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			-- { text = " " }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "󰁕 ", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" }
			-- { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine" }
		)
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Run/Continue" })

		-- dapui setup
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Dap UI" })
		vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Eval" })

		-- Ruby dap setup
		dap_ruby.setup()
	end,
	-- stylua: ignore
	-- keys = {
	-- { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
	-- { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },

	-- { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
	-- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
	-- { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
	-- { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
	-- { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
	-- { "<leader>dj", function() require("dap").down() end, desc = "Down" },
	-- { "<leader>dk", function() require("dap").up() end, desc = "Up" },
	-- { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
	-- { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
	-- { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
	-- { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
	-- { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
	-- { "<leader>ds", function() require("dap").session() end, desc = "Session" },
	-- { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
	-- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
	-- },
}
