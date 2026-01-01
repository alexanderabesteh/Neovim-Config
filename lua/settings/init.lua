local set = vim.opt

--> Settings <--
set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.conceallevel = 2
set.autowrite = true
set.undofile = true
set.clipboard = "unnamedplus"
set.signcolumn = "yes"
set.updatetime = 300

set.number = true
set.relativenumber = true
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"
set.timeoutlen = 1000

set.fillchars = "eob: "

--> Configure Diagnostic Display <--
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

--> Reduce noise <--
vim.opt.shortmess:append("c")

--> Prevent auto-commenting <--
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

--> Filetype-specific indentation <--
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "javascript", "lua" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})
--> WakaTime <--
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		vim.fn.system("~/.wakatime/wakatime-cli-linux-amd64 --sync-offline-activity 0 &")
	end,
})

--> Colorscheme <--
local nightfox = require("nightfox")

nightfox.setup({
	options = {
		styles = {
			comments = "italic",
			functions = "italic",
		},
	},
})

--> Load the configs <--
nightfox.load()
vim.cmd("colorscheme nordfox")
