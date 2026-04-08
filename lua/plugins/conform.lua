return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			black = {
				prepend_args = { "--fast" },
			},
		},
		formatters_by_ft = {
			sh = { "beautysh" },
			lua = { "stylua" },
			python = { "ruff" },
			javascript = { "prettier", "eslint_d" },
			typescript = { "prettier", "eslint_d" },
			javascriptreact = { "prettier", "eslint_d" },
			typescriptreact = { "prettier", "eslint_d" },
			svelte = { "prettier", "eslint_d" },
		},
		format_on_save = {
			async = false,
			timeout_ms = 5000,
			lsp_fallback = true,
		},
	},
	keys = {
		{
			"mp",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format buffer with Conform",
		},
	},
}
