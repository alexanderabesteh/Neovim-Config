return {
	"numToStr/Comment.nvim",
	opts = {
		-- you can add your options here, for example:
		-- padding = true,
		-- sticky = true,
		-- ignore = nil,
	},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
