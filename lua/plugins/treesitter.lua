return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- make sure parsers are updated automatically
  lazy = false,         -- Treesitter does not support lazy-loading
  config = function()
    local ts = require("nvim-treesitter")

    -- Setup the plugin itself
    ts.setup({
      -- Directory to install parsers (optional)
      install_dir = vim.fn.stdpath("data") .. "/site",

      -- Parsers you want installed
      ensure_installed = {
        "c", "cpp", "python", "lua", "rust", "javascript", "typescript",
        "html", "css", "bash", "json", "yaml", "toml", "go", "java",
        "php", "ruby", "swift", "haskell", "latex", "sql"
      },

      highlight = {
        enable = true,                     -- enable Treesitter highlighting
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },          -- enable Treesitter indentation

      -- Optional: rainbow parentheses
      rainbow = {
        enable = true,
        extended_mode = true, -- highlight non-bracket delimiters
        max_file_lines = nil,
      },

      -- Textobjects for motions and selections
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- jump forward to textobj
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
            ["]m"] = "@class.outer",
          },
          goto_next_end = {
            ["]["] = "@function.outer",
            ["]M"] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["[m"] = "@class.outer",
          },
          goto_previous_end = {
            ["[]"] = "@function.outer",
            ["[M"] = "@class.outer",
          },
        },
      },

      -- Refactor helpers
      refactor = {
        smart_rename = {
          enable = true,
          keymaps = { smart_rename = "grr" },
        },
      },

      -- Optional: playground for AST exploration
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    })

    local ft_with_ts = {
      "c", "cpp", "python", "lua", "rust", "javascript", "typescript",
      "html", "css", "bash", "json", "yaml", "toml", "go", "java",
      "php", "ruby", "swift", "haskell", "julia", "latex", "sql"
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = ft_with_ts,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
