local lint = require("lint")

lint.linters_by_ft = {
	--lua = { "luacheck" },
	python = { "ruff" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	cpp = { "cpplint" },
	swift = { "swiftlint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Lint current buffer" })
