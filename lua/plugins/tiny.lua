return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	opts = {
		options = {
			multines = {
				enabled = true,
				always_show = true,
			},
		},
	},
	config = function(_, opts)
		require("tiny-inline-diagnostic").setup(opts)
		-- Disable Neovim's default virtual text diagnostics
		vim.diagnostic.config({ virtual_text = false })
	end,
}
