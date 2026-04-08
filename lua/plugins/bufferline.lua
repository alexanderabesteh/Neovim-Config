return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false, -- plugin loads only when keys are pressed
	keys = {
		{ "<S-l>", ":bnext<CR>", desc = "Next buffer" },
		{ "<S-h>", ":bprevious<CR>", desc = "Previous buffer" },
		{ "<leader>bd", ":bdelete<CR>", desc = "Delete buffer" },
	},
	config = function()
		require("bufferline").setup({})
	end,
}
