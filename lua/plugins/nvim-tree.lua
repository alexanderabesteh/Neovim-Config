return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false, -- loads on startup; change to true if you want lazy loading
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
		{ "<leader>ge", ":NvimTreeFocus<CR>", desc = "Focus NvimTree" },
	},
	config = function()
		require("nvim-tree").setup()
	end,
}
