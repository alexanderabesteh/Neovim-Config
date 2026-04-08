return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>fd", ":Telescope diagnostics<CR>", desc = "Telescope Diagnostics" },
		{ "<leader>ff", ":Telescope find_files<CR>", desc = "Telescope Find Files" },
		{ "<leader>fr", ":Telescope lsp_references<CR>", desc = "Telescope LSP References" },
		{ "<leader>oc", ":Telescope lsp_outgoing_calls<CR>", desc = "Telescope LSP Outgoing Calls" },
		{ "<leader>fg", ":Telescope live_grep<CR>", desc = "Telescope Live Grep" },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Telescope Buffers" },
		{
			"<C-f>",
			":lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending'})<CR>",
			desc = "Telescope Fuzzy Find in Buffer",
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = { prompt_position = "top" },
			},
		})
		-- optionally load fzf extension
		pcall(telescope.load_extension, "fzf")
	end,
}
