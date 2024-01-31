return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"tpope/vim-fugitive",
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

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

		local keymap = vim.keymap
		keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { silent = true, desc = "Continue" })
		keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { silent = true, desc = "Step Over" })
		keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { silent = true, desc = "Step Into" })
		keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", { silent = true, desc = "Step Out" })
		keymap.set(
			"n",
			"<leader>db",
			"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
			{ silent = true, desc = "Breakpoint" }
		)
		keymap.set(
			"n",
			"<leader>dB",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			{ silent = true, desc = "Breakpoint Condition" }
		)
		keymap.set("n", "<leader>dd", "<cmd>lua require'dapui'.toggle()<cr>", { silent = true, desc = "Dap UI" })
		keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { silent = true, desc = "Run Last" })
	end,
}
