local dapui = require("dapui")
local dap = require("dap")

require("dapui").setup({})
require("nvim-dap-virtual-text").setup({
	commented = true, -- Show virtual text alongside comment
})
require("dap-python").setup("~/Documents/Programming/Python/Virtual/bin/python")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "~/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
	text = "", -- or "❌"
	texthl = "DiagnosticSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	text = "", -- or "→"
	texthl = "DiagnosticSignWarn",
	linehl = "Visual",
	numhl = "DiagnosticSignWarn",
})

-- Automatically open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

--> Debugging Keybinds <--
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, opts)

-- Continue / Start
vim.keymap.set("n", "<leader>dc", function()
	dap.continue()
end, opts)

-- Step Over
vim.keymap.set("n", "<leader>do", function()
	dap.step_over()
end, opts)

-- Step Into
vim.keymap.set("n", "<leader>di", function()
	dap.step_into()
end, opts)

-- Step Out
vim.keymap.set("n", "<leader>dO", function()
	dap.step_out()
end, opts)

-- Keymap to terminate debugging
vim.keymap.set("n", "<leader>dq", function()
	dap.terminate()
end, opts)

-- Toggle DAP UI
vim.keymap.set("n", "<leader>du", function()
	dapui.toggle()
end, opts)
