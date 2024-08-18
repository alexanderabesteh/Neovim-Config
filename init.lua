--> Load Plugins <--
require("plugins/rocks-config")
require("plugins/feline-config")
require("plugins/nvim-tree-config")
require("plugins/treesitter-config")
require("plugins/conform-config")
require("plugins/comment-nvim-config")
require("plugins/bufferline-config")
require("plugins/telescope-config")
require("plugins/vimtex-config")
require("plugins/nvim-cmp")

--> Load settings and keybindings <--
require("keymap-config")
require("settings")

--> Load other plugins <--
require('leap').create_default_mappings()
require("oil").setup()
require("nvim-autopairs").setup()
require("neogit").setup()
