require("nvim-treesitter.configs").setup({
    --> Parsers <--
    ensure_installed = {
        "c",
        "cpp",
        "css",
        "bash",
        "fish",
        "javascript",
        "lua",
        "typescript",
        "python",
        "rust",
        "fortran",
        "arduino",
        "html",
        "go",
        "java",
        "latex",
        "haskell",
        "julia"
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    --> Textobjects selection <--
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        --> LSP interop <--
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
            },
        },
    },
    --> Moving between textobjext <--
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
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
    --> Treesitter playground <--
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
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
    --> Refactor module
    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
    --> Rainbow tags
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    context_commentstring = {
        enable = false,
        enable_autocmd = false,
    },
})
