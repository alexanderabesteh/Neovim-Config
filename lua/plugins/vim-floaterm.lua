return {
	"voldikss/vim-floaterm",
	keys = {
		{ "<leader>t", ":FloatermToggle<CR>", desc = "Toggle Floaterm", mode = "n" },
		{ "<leader>t", "<C-\\><C-n>:FloatermToggle<CR>", desc = "Toggle Floaterm", mode = "t" },
		{ "<esc>", "<C-\\><C-n>:FloatermToggle<CR>", desc = "Exit Floaterm", mode = "t" },
	},
	config = function()
		vim.g.floaterm_width = 0.9
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_autoclose = 1
		vim.g.floaterm_opener = "edit"
	end,
}
