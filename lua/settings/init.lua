local set = vim.opt

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

set.number = true
set.relativenumber = false
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"

set.fillchars = "eob: "


local nightfox = require('nightfox')

nightfox.setup({
    options = {
        styles = {
            comments = 'italic',
            functions = 'italic',
        },
    }
})

-- load the configurations
nightfox.load()
vim.cmd("colorscheme nordfox")
