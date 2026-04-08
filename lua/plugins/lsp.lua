return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")
    local cmp_lsp = require("cmp_nvim_lsp")

    mason.setup()
    mason_lsp.setup({
      ensure_installed = { "pyright", "rust_analyzer", "clangd" },
    })

    -- Common on_attach for all LSP clients
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end

    local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Helper to start a client via the new API
    local function start_client(name, config)
      vim.lsp.start_client(vim.tbl_extend("force", {
        name = name,
        on_attach = on_attach,
        capabilities = capabilities,
      }, config or {}))
    end

    -- Setup servers manually (future-proof for nvim-lspconfig v3)
    local servers = {
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = vim.fs.dirname(vim.fs.find({ ".git", "pyproject.toml", "setup.py" }, { upward = true })[1] or vim.loop.cwd()),
      },
      rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml", ".git" }, { upward = true })[1] or vim.loop.cwd()),
      },
      clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1] or vim.loop.cwd()),
      },
      sourcekit = {
        cmd = { "sourcekit-lsp" },
        filetypes = { "swift" },
        root_dir = vim.fs.dirname(vim.fs.find({ "Package.swift", ".git" }, { upward = true })[1] or vim.loop.cwd()),
      },
    }

    for name, config in pairs(servers) do
      pcall(start_client, name, config)
    end
  end,
}
