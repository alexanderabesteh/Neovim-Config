--> Load Plugins <--
require("plugins/rocks-config")
require("plugins/nvim-tree-config")
require("plugins/treesitter-config")
require("plugins/conform-config")
require("plugins/comment-nvim-config")
require("plugins/bufferline-config")
require("plugins/telescope-config")
require("plugins/vimtex-config")
require("plugins/nvim-cmp")
require("plugins/lualine-config")
require("plugins/copilot-config")
require("plugins/which-key-config")
require("plugins/gitsigns-config")

--> Load settings and keybindings <--
require("keymap-config")
require("settings")

--> Load other plugins <--
require("plugins/dap-config")
require("plugins/linting-config")
require("leap").create_default_mappings()
require("oil").setup()
require("nvim-autopairs").setup()
require("neogit").setup()
