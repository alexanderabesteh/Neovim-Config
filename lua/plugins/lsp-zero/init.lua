local lsp_zero = require("lsp-zero")

--> Lsp_zero Setup <--
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})

local lspconfig = require("lspconfig")

lspconfig.sourcekit.setup({
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift" },
	root_dir = lspconfig.util.root_pattern("Package.swift", ".git"),
})
